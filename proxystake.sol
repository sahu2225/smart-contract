/**
 *Submitted for verification at polygonscan.com on 2024-04-05
*/

// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/utils/StorageSlot.sol


// OpenZeppelin Contracts (last updated v5.0.0) (utils/StorageSlot.sol)
// This file was procedurally generated from scripts/generate/templates/StorageSlot.js.

pragma solidity 0.8.25;

/**
 * @dev Library for reading and writing primitive types to specific storage slots.
 *
 * Storage slots are often used to avoid storage conflict when dealing with upgradeable contracts.
 * This library helps with reading and writing to such slots without the need for inline assembly.
 *
 * The functions in this library return Slot structs that contain a `value` member that can be used to read or write.
 *
 * Example usage to set ERC1967 implementation slot:
 * ```solidity
 * contract ERC1967 {
 *     bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
 *
 *     function _getImplementation() internal view returns (address) {
 *         return StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value;
 *     }
 *
 *     function _setImplementation(address newImplementation) internal {
 *         require(newImplementation.code.length > 0);
 *         StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value = newImplementation;
 *     }
 * }
 * ```
 */
library StorageSlot {
    struct AddressSlot {
        address value;
    }

    struct BooleanSlot {
        bool value;
    }

    struct Bytes32Slot {
        bytes32 value;
    }

    struct Uint256Slot {
        uint256 value;
    }

    struct StringSlot {
        string value;
    }

    struct BytesSlot {
        bytes value;
    }

    /**
     * @dev Returns an `AddressSlot` with member `value` located at `slot`.
     */
    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `BooleanSlot` with member `value` located at `slot`.
     */
    function getBooleanSlot(bytes32 slot) internal pure returns (BooleanSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `Bytes32Slot` with member `value` located at `slot`.
     */
    function getBytes32Slot(bytes32 slot) internal pure returns (Bytes32Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `Uint256Slot` with member `value` located at `slot`.
     */
    function getUint256Slot(bytes32 slot) internal pure returns (Uint256Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `StringSlot` with member `value` located at `slot`.
     */
    function getStringSlot(bytes32 slot) internal pure returns (StringSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `StringSlot` representation of the string storage pointer `store`.
     */
    function getStringSlot(string storage store) internal pure returns (StringSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := store.slot
        }
    }

    /**
     * @dev Returns an `BytesSlot` with member `value` located at `slot`.
     */
    function getBytesSlot(bytes32 slot) internal pure returns (BytesSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `BytesSlot` representation of the bytes storage pointer `store`.
     */
    function getBytesSlot(bytes storage store) internal pure returns (BytesSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := store.slot
        }
    }
}

// File: @openzeppelin/contracts/utils/Address.sol


// OpenZeppelin Contracts (last updated v5.0.0) (utils/Address.sol)

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev The ETH balance of the account is not enough to perform the operation.
     */
    error AddressInsufficientBalance(address account);

    /**
     * @dev There's no code at `target` (it is not a contract).
     */
    error AddressEmptyCode(address target);

    /**
     * @dev A call to an address target failed. The target may have reverted.
     */
    error FailedInnerCall();

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.8.20/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        if (address(this).balance < amount) {
            revert AddressInsufficientBalance(address(this));
        }

        (bool success, ) = recipient.call{value: amount}("");
        if (!success) {
            revert FailedInnerCall();
        }
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason or custom error, it is bubbled
     * up by this function (like regular Solidity function calls). However, if
     * the call reverted with no returned reason, this function reverts with a
     * {FailedInnerCall} error.
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        if (address(this).balance < value) {
            revert AddressInsufficientBalance(address(this));
        }
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and reverts if the target
     * was not a contract or bubbling up the revert reason (falling back to {FailedInnerCall}) in case of an
     * unsuccessful call.
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata
    ) internal view returns (bytes memory) {
        if (!success) {
            _revert(returndata);
        } else {
            // only check if target is a contract if the call was successful and the return data is empty
            // otherwise we already know that it was a contract
            if (returndata.length == 0 && target.code.length == 0) {
                revert AddressEmptyCode(target);
            }
            return returndata;
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and reverts if it wasn't, either by bubbling the
     * revert reason or with a default {FailedInnerCall} error.
     */
    function verifyCallResult(bool success, bytes memory returndata) internal pure returns (bytes memory) {
        if (!success) {
            _revert(returndata);
        } else {
            return returndata;
        }
    }

    /**
     * @dev Reverts with returndata if present. Otherwise reverts with {FailedInnerCall}.
     */
    function _revert(bytes memory returndata) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert FailedInnerCall();
        }
    }
}

// File: @openzeppelin/contracts/proxy/beacon/IBeacon.sol


// OpenZeppelin Contracts (last updated v5.0.0) (proxy/beacon/IBeacon.sol)

/**
 * @dev This is the interface that {BeaconProxy} expects of its beacon.
 */
interface IBeacon {
    /**
     * @dev Must return an address that can be used as a delegate call target.
     *
     * {UpgradeableBeacon} will check that this address is a contract.
     */
    function implementation() external view returns (address);
}

// File: @openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol


// OpenZeppelin Contracts (last updated v5.0.0) (proxy/ERC1967/ERC1967Utils.sol)



/**
 * @dev This abstract contract provides getters and event emitting update functions for
 * https://eips.ethereum.org/EIPS/eip-1967[EIP1967] slots.
 */
library ERC1967Utils {
    // We re-declare ERC-1967 events here because they can't be used directly from IERC1967.
    // This will be fixed in Solidity 0.8.21. At that point we should remove these events.
    /**
     * @dev Emitted when the implementation is upgraded.
     */
    event Upgraded(address indexed implementation);

    /**
     * @dev Emitted when the admin account has changed.
     */
    event AdminChanged(address previousAdmin, address newAdmin);

    /**
     * @dev Emitted when the beacon is changed.
     */
    event BeaconUpgraded(address indexed beacon);

    /**
     * @dev Storage slot with the address of the current implementation.
     * This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1.
     */
    // solhint-disable-next-line private-vars-leading-underscore
    bytes32 internal constant IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    /**
     * @dev The `implementation` of the proxy is invalid.
     */
    error ERC1967InvalidImplementation(address implementation);

    /**
     * @dev The `admin` of the proxy is invalid.
     */
    error ERC1967InvalidAdmin(address admin);

    /**
     * @dev The `beacon` of the proxy is invalid.
     */
    error ERC1967InvalidBeacon(address beacon);

    /**
     * @dev An upgrade function sees `msg.value > 0` that may be lost.
     */
    error ERC1967NonPayable();

    /**
     * @dev Returns the current implementation address.
     */
    function getImplementation() internal view returns (address) {
        return StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value;
    }

    /**
     * @dev Stores a new address in the EIP1967 implementation slot.
     */
    function _setImplementation(address newImplementation) private {
        if (newImplementation.code.length == 0) {
            revert ERC1967InvalidImplementation(newImplementation);
        }
        StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value = newImplementation;
    }

    /**
     * @dev Performs implementation upgrade with additional setup call if data is nonempty.
     * This function is payable only if the setup call is performed, otherwise `msg.value` is rejected
     * to avoid stuck value in the contract.
     *
     * Emits an {IERC1967-Upgraded} event.
     */
    function upgradeToAndCall(address newImplementation, bytes memory data) internal {
        _setImplementation(newImplementation);
        emit Upgraded(newImplementation);

        if (data.length > 0) {
            Address.functionDelegateCall(newImplementation, data);
        } else {
            _checkNonPayable();
        }
    }

    /**
     * @dev Storage slot with the admin of the contract.
     * This is the keccak-256 hash of "eip1967.proxy.admin" subtracted by 1.
     */
    // solhint-disable-next-line private-vars-leading-underscore
    bytes32 internal constant ADMIN_SLOT = 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;

    /**
     * @dev Returns the current admin.
     *
     * TIP: To get this value clients can read directly from the storage slot shown below (specified by EIP1967) using
     * the https://eth.wiki/json-rpc/API#eth_getstorageat[`eth_getStorageAt`] RPC call.
     * `0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103`
     */
    function getAdmin() internal view returns (address) {
        return StorageSlot.getAddressSlot(ADMIN_SLOT).value;
    }

    /**
     * @dev Stores a new address in the EIP1967 admin slot.
     */
    function _setAdmin(address newAdmin) private {
        if (newAdmin == address(0)) {
            revert ERC1967InvalidAdmin(address(0));
        }
        StorageSlot.getAddressSlot(ADMIN_SLOT).value = newAdmin;
    }

    /**
     * @dev Changes the admin of the proxy.
     *
     * Emits an {IERC1967-AdminChanged} event.
     */
    function changeAdmin(address newAdmin) internal {
        emit AdminChanged(getAdmin(), newAdmin);
        _setAdmin(newAdmin);
    }

    /**
     * @dev The storage slot of the UpgradeableBeacon contract which defines the implementation for this proxy.
     * This is the keccak-256 hash of "eip1967.proxy.beacon" subtracted by 1.
     */
    // solhint-disable-next-line private-vars-leading-underscore
    bytes32 internal constant BEACON_SLOT = 0xa3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50;

    /**
     * @dev Returns the current beacon.
     */
    function getBeacon() internal view returns (address) {
        return StorageSlot.getAddressSlot(BEACON_SLOT).value;
    }

    /**
     * @dev Stores a new beacon in the EIP1967 beacon slot.
     */
    function _setBeacon(address newBeacon) private {
        if (newBeacon.code.length == 0) {
            revert ERC1967InvalidBeacon(newBeacon);
        }

        StorageSlot.getAddressSlot(BEACON_SLOT).value = newBeacon;

        address beaconImplementation = IBeacon(newBeacon).implementation();
        if (beaconImplementation.code.length == 0) {
            revert ERC1967InvalidImplementation(beaconImplementation);
        }
    }

    /**
     * @dev Change the beacon and trigger a setup call if data is nonempty.
     * This function is payable only if the setup call is performed, otherwise `msg.value` is rejected
     * to avoid stuck value in the contract.
     *
     * Emits an {IERC1967-BeaconUpgraded} event.
     *
     * CAUTION: Invoking this function has no effect on an instance of {BeaconProxy} since v5, since
     * it uses an immutable beacon without looking at the value of the ERC-1967 beacon slot for
     * efficiency.
     */
    function upgradeBeaconToAndCall(address newBeacon, bytes memory data) internal {
        _setBeacon(newBeacon);
        emit BeaconUpgraded(newBeacon);

        if (data.length > 0) {
            Address.functionDelegateCall(IBeacon(newBeacon).implementation(), data);
        } else {
            _checkNonPayable();
        }
    }

    /**
     * @dev Reverts if `msg.value` is not zero. It can be used to avoid `msg.value` stuck in the contract
     * if an upgrade doesn't perform an initialization call.
     */
    function _checkNonPayable() private {
        if (msg.value > 0) {
            revert ERC1967NonPayable();
        }
    }
}

// File: @openzeppelin/contracts/interfaces/draft-IERC1822.sol


// OpenZeppelin Contracts (last updated v5.0.0) (interfaces/draft-IERC1822.sol)

/**
 * @dev ERC1822: Universal Upgradeable Proxy Standard (UUPS) documents a method for upgradeability through a simplified
 * proxy whose upgrades are fully controlled by the current implementation.
 */
interface IERC1822Proxiable {
    /**
     * @dev Returns the storage slot that the proxiable contract assumes is being used to store the implementation
     * address.
     *
     * IMPORTANT: A proxy pointing at a proxiable contract should not be considered proxiable itself, because this risks
     * bricking a proxy that upgrades to it, by delegating to itself until out of gas. Thus it is critical that this
     * function revert if invoked through a proxy.
     */
    function proxiableUUID() external view returns (bytes32);
}

// File: @openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (proxy/utils/Initializable.sol)

/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since proxied contracts do not make use of a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * The initialization functions use a version number. Once a version number is used, it is consumed and cannot be
 * reused. This mechanism prevents re-execution of each "step" but allows the creation of new initialization steps in
 * case an upgrade adds a module that needs to be initialized.
 *
 * For example:
 *
 * [.hljs-theme-light.nopadding]
 * ```solidity
 * contract MyToken is ERC20Upgradeable {
 *     function initialize() initializer public {
 *         __ERC20_init("MyToken", "MTK");
 *     }
 * }
 *
 * contract MyTokenV2 is MyToken, ERC20PermitUpgradeable {
 *     function initializeV2() reinitializer(2) public {
 *         __ERC20Permit_init("MyToken");
 *     }
 * }
 * ```
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {ERC1967Proxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 *
 * [CAUTION]
 * ====
 * Avoid leaving a contract uninitialized.
 *
 * An uninitialized contract can be taken over by an attacker. This applies to both a proxy and its implementation
 * contract, which may impact the proxy. To prevent the implementation contract from being used, you should invoke
 * the {_disableInitializers} function in the constructor to automatically lock it when it is deployed:
 *
 * [.hljs-theme-light.nopadding]
 * ```
 * /// @custom:oz-upgrades-unsafe-allow constructor
 * constructor() {
 *     _disableInitializers();
 * }
 * ```
 * ====
 */
abstract contract Initializable {
    /**
     * @dev Storage of the initializable contract.
     *
     * It's implemented on a custom ERC-7201 namespace to reduce the risk of storage collisions
     * when using with upgradeable contracts.
     *
     * @custom:storage-location erc7201:openzeppelin.storage.Initializable
     */
    struct InitializableStorage {
        /**
         * @dev Indicates that the contract has been initialized.
         */
        uint64 _initialized;
        /**
         * @dev Indicates that the contract is in the process of being initialized.
         */
        bool _initializing;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.Initializable")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant INITIALIZABLE_STORAGE = 0xf0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00;

    /**
     * @dev The contract is already initialized.
     */
    error InvalidInitialization();

    /**
     * @dev The contract is not initializing.
     */
    error NotInitializing();

    /**
     * @dev Triggered when the contract has been initialized or reinitialized.
     */
    event Initialized(uint64 version);

    /**
     * @dev A modifier that defines a protected initializer function that can be invoked at most once. In its scope,
     * `onlyInitializing` functions can be used to initialize parent contracts.
     *
     * Similar to `reinitializer(1)`, except that in the context of a constructor an `initializer` may be invoked any
     * number of times. This behavior in the constructor can be useful during testing and is not expected to be used in
     * production.
     *
     * Emits an {Initialized} event.
     */
    modifier initializer() {
        // solhint-disable-next-line var-name-mixedcase
        InitializableStorage storage $ = _getInitializableStorage();

        // Cache values to avoid duplicated sloads
        bool isTopLevelCall = !$._initializing;
        uint64 initialized = $._initialized;

        // Allowed calls:
        // - initialSetup: the contract is not in the initializing state and no previous version was
        //                 initialized
        // - construction: the contract is initialized at version 1 (no reininitialization) and the
        //                 current contract is just being deployed
        bool initialSetup = initialized == 0 && isTopLevelCall;
        bool construction = initialized == 1 && address(this).code.length == 0;

        if (!initialSetup && !construction) {
            revert InvalidInitialization();
        }
        $._initialized = 1;
        if (isTopLevelCall) {
            $._initializing = true;
        }
        _;
        if (isTopLevelCall) {
            $._initializing = false;
            emit Initialized(1);
        }
    }

    /**
     * @dev A modifier that defines a protected reinitializer function that can be invoked at most once, and only if the
     * contract hasn't been initialized to a greater version before. In its scope, `onlyInitializing` functions can be
     * used to initialize parent contracts.
     *
     * A reinitializer may be used after the original initialization step. This is essential to configure modules that
     * are added through upgrades and that require initialization.
     *
     * When `version` is 1, this modifier is similar to `initializer`, except that functions marked with `reinitializer`
     * cannot be nested. If one is invoked in the context of another, execution will revert.
     *
     * Note that versions can jump in increments greater than 1; this implies that if multiple reinitializers coexist in
     * a contract, executing them in the right order is up to the developer or operator.
     *
     * WARNING: Setting the version to 2**64 - 1 will prevent any future reinitialization.
     *
     * Emits an {Initialized} event.
     */
    modifier reinitializer(uint64 version) {
        // solhint-disable-next-line var-name-mixedcase
        InitializableStorage storage $ = _getInitializableStorage();

        if ($._initializing || $._initialized >= version) {
            revert InvalidInitialization();
        }
        $._initialized = version;
        $._initializing = true;
        _;
        $._initializing = false;
        emit Initialized(version);
    }

    /**
     * @dev Modifier to protect an initialization function so that it can only be invoked by functions with the
     * {initializer} and {reinitializer} modifiers, directly or indirectly.
     */
    modifier onlyInitializing() {
        _checkInitializing();
        _;
    }

    /**
     * @dev Reverts if the contract is not in an initializing state. See {onlyInitializing}.
     */
    function _checkInitializing() internal view virtual {
        if (!_isInitializing()) {
            revert NotInitializing();
        }
    }

    /**
     * @dev Locks the contract, preventing any future reinitialization. This cannot be part of an initializer call.
     * Calling this in the constructor of a contract will prevent that contract from being initialized or reinitialized
     * to any version. It is recommended to use this to lock implementation contracts that are designed to be called
     * through proxies.
     *
     * Emits an {Initialized} event the first time it is successfully executed.
     */
    function _disableInitializers() internal virtual {
        // solhint-disable-next-line var-name-mixedcase
        InitializableStorage storage $ = _getInitializableStorage();

        if ($._initializing) {
            revert InvalidInitialization();
        }
        if ($._initialized != type(uint64).max) {
            $._initialized = type(uint64).max;
            emit Initialized(type(uint64).max);
        }
    }

    /**
     * @dev Returns the highest version that has been initialized. See {reinitializer}.
     */
    function _getInitializedVersion() internal view returns (uint64) {
        return _getInitializableStorage()._initialized;
    }

    /**
     * @dev Returns `true` if the contract is currently initializing. See {onlyInitializing}.
     */
    function _isInitializing() internal view returns (bool) {
        return _getInitializableStorage()._initializing;
    }

    /**
     * @dev Returns a pointer to the storage namespace.
     */
    // solhint-disable-next-line var-name-mixedcase
    function _getInitializableStorage() private pure returns (InitializableStorage storage $) {
        assembly {
            $.slot := INITIALIZABLE_STORAGE
        }
    }
}

// File: @openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.9.0) (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;


/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuardUpgradeable is Initializable {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    function __ReentrancyGuard_init() internal onlyInitializing {
        __ReentrancyGuard_init_unchained();
    }

    function __ReentrancyGuard_init_unchained() internal onlyInitializing {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == _ENTERED;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (proxy/utils/UUPSUpgradeable.sol)


/**
 * @dev An upgradeability mechanism designed for UUPS proxies. The functions included here can perform an upgrade of an
 * {ERC1967Proxy}, when this contract is set as the implementation behind such a proxy.
 *
 * A security mechanism ensures that an upgrade does not turn off upgradeability accidentally, although this risk is
 * reinstated if the upgrade retains upgradeability but removes the security mechanism, e.g. by replacing
 * `UUPSUpgradeable` with a custom implementation of upgrades.
 *
 * The {_authorizeUpgrade} function must be overridden to include access restriction to the upgrade mechanism.
 */
abstract contract UUPSUpgradeable is Initializable, IERC1822Proxiable {
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable
    address private immutable __self = address(this);

    /**
     * @dev The version of the upgrade interface of the contract. If this getter is missing, both `upgradeTo(address)`
     * and `upgradeToAndCall(address,bytes)` are present, and `upgradeTo` must be used if no function should be called,
     * while `upgradeToAndCall` will invoke the `receive` function if the second argument is the empty byte string.
     * If the getter returns `"5.0.0"`, only `upgradeToAndCall(address,bytes)` is present, and the second argument must
     * be the empty byte string if no function should be called, making it impossible to invoke the `receive` function
     * during an upgrade.
     */
    string public constant UPGRADE_INTERFACE_VERSION = "5.0.0";

    /**
     * @dev The call is from an unauthorized context.
     */
    error UUPSUnauthorizedCallContext();

    /**
     * @dev The storage `slot` is unsupported as a UUID.
     */
    error UUPSUnsupportedProxiableUUID(bytes32 slot);

    /**
     * @dev Check that the execution is being performed through a delegatecall call and that the execution context is
     * a proxy contract with an implementation (as defined in ERC1967) pointing to self. This should only be the case
     * for UUPS and transparent proxies that are using the current contract as their implementation. Execution of a
     * function through ERC1167 minimal proxies (clones) would not normally pass this test, but is not guaranteed to
     * fail.
     */
    modifier onlyProxy() {
        _checkProxy();
        _;
    }

    /**
     * @dev Check that the execution is not being performed through a delegate call. This allows a function to be
     * callable on the implementing contract but not through proxies.
     */
    modifier notDelegated() {
        _checkNotDelegated();
        _;
    }

    function __UUPSUpgradeable_init() internal onlyInitializing {
    }

    function __UUPSUpgradeable_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Implementation of the ERC1822 {proxiableUUID} function. This returns the storage slot used by the
     * implementation. It is used to validate the implementation's compatibility when performing an upgrade.
     *
     * IMPORTANT: A proxy pointing at a proxiable contract should not be considered proxiable itself, because this risks
     * bricking a proxy that upgrades to it, by delegating to itself until out of gas. Thus it is critical that this
     * function revert if invoked through a proxy. This is guaranteed by the `notDelegated` modifier.
     */
    function proxiableUUID() external view virtual notDelegated returns (bytes32) {
        return ERC1967Utils.IMPLEMENTATION_SLOT;
    }

    /**
     * @dev Upgrade the implementation of the proxy to `newImplementation`, and subsequently execute the function call
     * encoded in `data`.
     *
     * Calls {_authorizeUpgrade}.
     *
     * Emits an {Upgraded} event.
     *
     * @custom:oz-upgrades-unsafe-allow-reachable delegatecall
     */
    function upgradeToAndCall(address newImplementation, bytes memory data) public payable virtual onlyProxy {
        _authorizeUpgrade(newImplementation);
        _upgradeToAndCallUUPS(newImplementation, data);
    }

    /**
     * @dev Reverts if the execution is not performed via delegatecall or the execution
     * context is not of a proxy with an ERC1967-compliant implementation pointing to self.
     * See {_onlyProxy}.
     */
    function _checkProxy() internal view virtual {
        if (
            address(this) == __self || // Must be called through delegatecall
            ERC1967Utils.getImplementation() != __self // Must be called through an active proxy
        ) {
            revert UUPSUnauthorizedCallContext();
        }
    }

    /**
     * @dev Reverts if the execution is performed via delegatecall.
     * See {notDelegated}.
     */
    function _checkNotDelegated() internal view virtual {
        if (address(this) != __self) {
            // Must not be called through delegatecall
            revert UUPSUnauthorizedCallContext();
        }
    }

    /**
     * @dev Function that should revert when `msg.sender` is not authorized to upgrade the contract. Called by
     * {upgradeToAndCall}.
     *
     * Normally, this function will use an xref:access.adoc[access control] modifier such as {Ownable-onlyOwner}.
     *
     * ```solidity
     * function _authorizeUpgrade(address) internal onlyOwner {}
     * ```
     */
    function _authorizeUpgrade(address newImplementation) internal virtual;

    /**
     * @dev Performs an implementation upgrade with a security check for UUPS proxies, and additional setup call.
     *
     * As a security check, {proxiableUUID} is invoked in the new implementation, and the return value
     * is expected to be the implementation slot in ERC1967.
     *
     * Emits an {IERC1967-Upgraded} event.
     */
    function _upgradeToAndCallUUPS(address newImplementation, bytes memory data) private {
        try IERC1822Proxiable(newImplementation).proxiableUUID() returns (bytes32 slot) {
            if (slot != ERC1967Utils.IMPLEMENTATION_SLOT) {
                revert UUPSUnsupportedProxiableUUID(slot);
            }
            ERC1967Utils.upgradeToAndCall(newImplementation, data);
        } catch {
            // The implementation is not UUPS
            revert ERC1967Utils.ERC1967InvalidImplementation(newImplementation);
        }
    }
}

// File: @openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol


// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)


/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal onlyInitializing {
    }

    function __Context_init_unchained() internal onlyInitializing {
    }
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: @openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.Ownable
    struct OwnableStorage {
        address _owner;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.Ownable")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OwnableStorageLocation = 0x9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300;

    function _getOwnableStorage() private pure returns (OwnableStorage storage $) {
        assembly {
            $.slot := OwnableStorageLocation
        }
    }

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    function __Ownable_init(address initialOwner) internal onlyInitializing {
        __Ownable_init_unchained(initialOwner);
    }

    function __Ownable_init_unchained(address initialOwner) internal onlyInitializing {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        OwnableStorage storage $ = _getOwnableStorage();
        return $._owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        OwnableStorage storage $ = _getOwnableStorage();
        address oldOwner = $._owner;
        $._owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File: @openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.9.0) (utils/Address.sol)

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     *
     * Furthermore, `isContract` will also return true if the target contract within
     * the same transaction is already scheduled for destruction by `SELFDESTRUCT`,
     * which only has an effect at the end of a transaction.
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.8.0/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and revert (either by bubbling
     * the revert reason or using the provided one) in case of unsuccessful call or if target was not a contract.
     *
     * _Available since v4.8._
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        if (success) {
            if (returndata.length == 0) {
                // only check isContract if the call was successful and the return data is empty
                // otherwise we already know that it was a contract
                require(isContract(target), "Address: call to non-contract");
            }
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason or using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    function _revert(bytes memory returndata, string memory errorMessage) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }
}

// File: @openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20PermitUpgradeable.sol


/**
 * @dev Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 *
 * ==== Security Considerations
 *
 * There are two important considerations concerning the use of `permit`. The first is that a valid permit signature
 * expresses an allowance, and it should not be assumed to convey additional meaning. In particular, it should not be
 * considered as an intention to spend the allowance in any specific way. The second is that because permits have
 * built-in replay protection and can be submitted by anyone, they can be frontrun. A protocol that uses permits should
 * take this into consideration and allow a `permit` call to fail. Combining these two aspects, a pattern that may be
 * generally recommended is:
 *
 * ```solidity
 * function doThingWithPermit(..., uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public {
 *     try token.permit(msg.sender, address(this), value, deadline, v, r, s) {} catch {}
 *     doThing(..., value);
 * }
 *
 * function doThing(..., uint256 value) public {
 *     token.safeTransferFrom(msg.sender, address(this), value);
 *     ...
 * }
 * ```
 *
 * Observe that: 1) `msg.sender` is used as the owner, leaving no ambiguity as to the signer intent, and 2) the use of
 * `try/catch` allows the permit to fail and makes the code tolerant to frontrunning. (See also
 * {SafeERC20-safeTransferFrom}).
 *
 * Additionally, note that smart contract wallets (such as Argent or Safe) are not able to produce permit signatures, so
 * contracts should have entry points that don't rely on permit.
 */
interface IERC20PermitUpgradeable {
    /**
     * @dev Sets `value` as the allowance of `spender` over ``owner``'s tokens,
     * given ``owner``'s signed approval.
     *
     * IMPORTANT: The same issues {IERC20-approve} has related to transaction
     * ordering also apply here.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `deadline` must be a timestamp in the future.
     * - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
     * over the EIP712-formatted function arguments.
     * - the signature must use ``owner``'s current nonce (see {nonces}).
     *
     * For more information on the signature format, see the
     * https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
     * section].
     *
     * CAUTION: See Security Considerations above.
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /**
     * @dev Returns the current nonce for `owner`. This value must be
     * included whenever a signature is generated for {permit}.
     *
     * Every successful call to {permit} increases ``owner``'s nonce by one. This
     * prevents a signature from being used multiple times.
     */
    function nonces(address owner) external view returns (uint256);

    /**
     * @dev Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}

// File: @openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol


// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20Upgradeable {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
    /**
     * @dev Returns the amount of tokens in existence.
     */
    
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
     /// user burn their own Token
    function burn(uint256 _amount) external ;

}

// File: @openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol


/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20Upgradeable {
    using AddressUpgradeable for address;

    /**
     * @dev Transfer `value` amount of `token` from the calling contract to `to`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeTransfer(IERC20Upgradeable token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    /**
     * @dev Transfer `value` amount of `token` from `from` to `to`, spending the approval given by `from` to the
     * calling contract. If `token` returns no value, non-reverting calls are assumed to be successful.
     */
    function safeTransferFrom(IERC20Upgradeable token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20Upgradeable token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    /**
     * @dev Increase the calling contract's allowance toward `spender` by `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeIncreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        uint256 oldAllowance = token.allowance(address(this), spender);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, oldAllowance + value));
    }

    /**
     * @dev Decrease the calling contract's allowance toward `spender` by `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeDecreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, oldAllowance - value));
        }
    }

    /**
     * @dev Set the calling contract's allowance toward `spender` to `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful. Meant to be used with tokens that require the approval
     * to be set to zero before setting it to a non-zero value, such as USDT.
     */
    function forceApprove(IERC20Upgradeable token, address spender, uint256 value) internal {
        bytes memory approvalCall = abi.encodeWithSelector(token.approve.selector, spender, value);

        if (!_callOptionalReturnBool(token, approvalCall)) {
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, 0));
            _callOptionalReturn(token, approvalCall);
        }
    }

    /**
     * @dev Use a ERC-2612 signature to set the `owner` approval toward `spender` on `token`.
     * Revert on invalid signature.
     */
    function safePermit(
        IERC20PermitUpgradeable token,
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal {
        uint256 nonceBefore = token.nonces(owner);
        token.permit(owner, spender, value, deadline, v, r, s);
        uint256 nonceAfter = token.nonces(owner);
        require(nonceAfter == nonceBefore + 1, "SafeERC20: permit did not succeed");
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20Upgradeable token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address-functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        require(returndata.length == 0 || abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     *
     * This is a variant of {_callOptionalReturn} that silents catches all reverts and returns a bool instead.
     */
    function _callOptionalReturnBool(IERC20Upgradeable token, bytes memory data) private returns (bool) {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We cannot use {Address-functionCall} here since this should return false
        // and not revert is the subcall reverts.

        (bool success, bytes memory returndata) = address(token).call(data);
        return
            success && (returndata.length == 0 || abi.decode(returndata, (bool))) && AddressUpgradeable.isContract(address(token));
    }
}



/// @title Stake Contract
/// @author CBA
/// @notice You can use this contract for staking, restaking and withdraw tokens.
/// @dev All function calls are currently implemented as per requirements.

contract wallekStake is
    Initializable,
    OwnableUpgradeable,
    UUPSUpgradeable,
    ReentrancyGuardUpgradeable
{
    ///Safe ERC20 Implementation for ERC20 transfers
    using SafeERC20Upgradeable for IERC20Upgradeable;
    /// token contract
    IERC20Upgradeable public stakeToken;
    /// second token contract
    IERC20Upgradeable public stake2Token ;
    /// Total first Locked Amount in Stake Contract 
    uint256 public totalTokenLocked;
    /// Total second Locked Amount in Stake Contract
    uint256 public totalTokenLocked2;
     /// time Lock of second token
    uint256 public secondTokenLockedTime;
    /// stake Fee in Stake Contract
    uint256 public stakeFee; // 2.5 % = 250
    /// stake Fee in Stake Contract
    uint256 public serviceFee; // 2.5 % = 250
    /// first token Total  Fee in Stake Contract
    uint256 public totalFeeCollected;
    /// second token Total  Fee in Stake Contract
    uint256 public totalFeeCollected2;
    /// Minimum sign required for pass proposal
    uint256 public minSigRequired;
    /// top holder of stake Token
    address[] public topHolders;
    ///  the address of the new implementation contract.
    address public proposedUpgradeContract ;
    /// Mapping of admin addresses to their authorization status
    mapping(address => bool) public adminList;
    /// Mapping of user addresses to their next stake ID for 1 token
    mapping(address => uint256) public nextStakeId;
    /// Mapping of user addresses to their next stake ID for 2 token
    mapping(address => uint256) public nextStake2Id;
    /// Mapping of user addresses to their freeze status
    mapping(address => bool) public freezeList;
    /// Mapping of implementation address to the number of votes
    mapping(address => uint256) approvals;
    /// Mapping of user addresses to addresses they have voted for
    mapping(address => mapping(address => bool)) public voted;
    /// Mapping of user addresses to their stake details
    mapping(address => mapping(uint256 => Stakes)) public stakeDetails;
    /// Mapping of user addresses to their stake2 details
    mapping(address => mapping(uint256 => Stakes2)) public stake2Details;
    struct Stakes {
        address user;
        uint256 stakeAmount;
        uint256 startTime;
        uint256 endTime;
        uint256 claimTime;
    }
        struct Stakes2 {
        address user;
        uint256 stakeAmount;
        uint256 startTime;
        uint256 endTime;
        uint256 claimTime;
    }
    /// Event emitted when a user  tokens from a stake
    event Staked(
        uint256 stakeId,
        uint256 amount,
        uint256 feeAmount,
        uint256 startTime,
        uint256 endTime,
        string symbol
    );
    
    /// Event emitted when a user stakes tokens
    event Withdrawn(uint256 amount ,string symbol);
    /// Event emitted when a  unstake burn tokens
    event Burn(uint256 amount ,string symbol);
    
    /// Event emitted when native currency (MATIC) is withdrawn
    event WithdrawNative(address indexed sender, uint256 amount);
    
    /// Event emitted when ERC20 tokens are withdrawn
    event WithdrawToken(address indexed sender, address token, uint256 amount);
    /// Event emitted when the stake fee is set for staking operations
    event StakeFeeSet(
        address indexed admin,
        uint256 stakeFee,
        uint256 serviceFee
    );
    /// Event emitted when an address is added or removed from the admin list
    event AdminStatusChanged(
        address indexed owner,
        address indexed admin,
        bool status
    );
    /// Event emitted when the wallet address associated with a user's stakes is updated
    event StakeWalletUpdated(
        address indexed user,
        uint256 indexed stakeId,
        address newWallet
    );
    /// Event emitted when a member of the DAO votes for the upgrade of the contract's implementation
    event UpgradeVote(address indexed voter, address indexed newImplementation);
    /// Event emitted when a member revokes their vote for the upgrade of the contract's implementation
    event VoteRevoked(address indexed voter, address indexed newImplementation);
   /// Event emitted when the list of owners and the minimum required signatures for DAO operations are set
    event OwnersAndMinimumSignaturesSet(
        address[] newOwners,
        uint256 sigRequired
    );
    /// Event emitted when addresses are added or removed from the freeze list
    event FreezeWalletUpdated(address[] indexed wallets, bool flag);
    /// Event emitted when fees are withdrawn by the admin
    event FeeWithdrawn(address indexed admin, uint256 amount);

    /// Custom error messages
    error InvalidStakeConfiguration();
    error StakeTokenAlreadySet();
    error InvalidMinimumStakeAmount();
    error InvalidImplementationAddress();
    error InvalidSignatureRequirement();
    error DuplicateOrZeroAddressFound();
    error ZeroClaimAmount();
    error MinimumSignatureNotMet();
    error MinimumSignatureNotSet();
    error AlreadyVoted();
    error NotVotedBefore();
    error SignatureLengthNotMatched();
    error NotAnAdmin();
    error NotMemberOfDAO();
    error FrozenAddress();
    error InsufficientStakeTokenBalance();


    /// Modifier to restrict access to only the contract owner or authorized admins
    modifier onlyAdmin() {
        if(owner() != msg.sender && !adminList[msg.sender]){
            revert NotAnAdmin();
        }
        _;
    }

    /// Modifier to restrict access to only DAO members or the contract owner
    modifier onlyDAO() {
        if(!existsInArray(msg.sender) && owner() != msg.sender){
            revert NotMemberOfDAO();
        }
        _;
    }

      /// Modifier to ensure address is not frozen
    modifier notFrozen(address _addr) {
        if(freezeList[_addr]){
            revert FrozenAddress();
        }
        _;
    }
/// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
    _disableInitializers();
    }
 
     /// @dev Initializes the Locker contract.
    /// @param _stakeToken The address of the token to be used for staking.
   
    function initialize(  address _stakeToken , address _stake2Token) external initializer {
        if(_stakeToken == address(0) ||  _stake2Token == address(0) || _stakeToken == _stake2Token ){
            revert InvalidStakeConfiguration();
        }
         stakeToken = IERC20Upgradeable(_stakeToken);
         stake2Token = IERC20Upgradeable(_stake2Token);
         secondTokenLockedTime = 730  * 1 days ;
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
        __ReentrancyGuard_init();
    }


/// @dev Sets the stake fee parameters including stake token, stake fee, and service fee.
/// @param _stakeFee The fee percentage to be charged for staking.
 /// @param _serviceFee The service fee percentage to be charged.

function setStakeFee(
    uint256 _stakeFee,
    uint256 _serviceFee
) external onlyAdmin {
    stakeFee = _stakeFee;
    serviceFee = _serviceFee;
    emit StakeFeeSet(msg.sender, _stakeFee, _serviceFee);
}

  
     /// @dev Adds or removes an address from the admin list.
     /// Only the contract owner can call this function.
     /// @param _addr The address to be added or removed from the admin list.
     /// @param _flag Boolean flag indicating whether to add or remove the address.///
    function addNRemoveAdmin(address _addr, bool _flag) external onlyOwner {
        adminList[_addr] = _flag;
        emit AdminStatusChanged(msg.sender, _addr, _flag);
    }
    
     /// @dev Allows users to stake first tokens for a specified period.
     /// @param amount The amount of first tokens to stake .
     /// @param _stakePeriod The duration for which the tokens will be staked.
     
    function stake(uint256 amount, uint256 _stakePeriod) external nonReentrant notFrozen(msg.sender) {
        if (amount < (1 * (10 ** stakeToken.decimals()))) revert InvalidMinimumStakeAmount();
        uint256 feeAmount = (amount * stakeFee) / 10000;
        uint256 netAmount = amount - feeAmount;
        totalTokenLocked += netAmount;
        totalFeeCollected += feeAmount;
        uint256 stakeId = nextStakeId[msg.sender];
        stakeDetails[msg.sender][stakeId] = Stakes(
            msg.sender,
            netAmount,
            block.timestamp,
            block.timestamp + _stakePeriod,
            0
        );
           
        emit Staked(
            stakeId,
            netAmount,
            feeAmount,
            stakeDetails[msg.sender][stakeId].startTime,
            stakeDetails[msg.sender][stakeId].endTime,
            stakeToken.symbol()
        );
        nextStakeId[msg.sender]++;

        stakeToken.safeTransferFrom(msg.sender, address(this), amount);
    }

         /// @dev Allows users to stake second tokens for a specified period.
     /// @param amount The amount of tokens to stake.
     
    function stake2(uint256 amount) external nonReentrant notFrozen(msg.sender) {
        if (amount < (1 * (10 ** stake2Token.decimals()))) revert InvalidMinimumStakeAmount();
        uint256 feeAmount = (amount * stakeFee) / 10000;
        uint256 netAmount = amount - feeAmount;
        totalTokenLocked2 += netAmount;
        totalFeeCollected2 += feeAmount;
        uint256 stakeId = nextStake2Id[msg.sender];
        stake2Details[msg.sender][stakeId] = Stakes2(
            msg.sender,
            netAmount,
            block.timestamp,
            block.timestamp + secondTokenLockedTime,
            0
        );
           
        emit Staked(
            stakeId,
            netAmount,
            feeAmount,
            stake2Details[msg.sender][stakeId].startTime,
            stake2Details[msg.sender][stakeId].endTime,
            stake2Token.symbol()
        );
        nextStake2Id[msg.sender]++;

        stake2Token.safeTransferFrom(msg.sender, address(this), amount);
    }
   
     /// @dev Allows users to stake first tokens for a specified period.
     /// @param _stakePeriod The duration for which the tokens will be staked.
     
    function reStake(uint256 _stakePeriod) external notFrozen(msg.sender) {
        uint256 amount = checkValidityExpireAmount(msg.sender);
        totalTokenLocked -= amount;
        uint256 stakeId = nextStakeId[msg.sender];
        uint256 feeAmount = (amount * stakeFee) / 10000;
        uint256 netAmount = amount - feeAmount;
        totalTokenLocked += netAmount;
        totalFeeCollected += feeAmount;
        stakeDetails[msg.sender][stakeId] = Stakes(
            msg.sender,
            netAmount,
            block.timestamp,
            block.timestamp + _stakePeriod,
            0
        );
        emit Staked(
            stakeId,
            netAmount,
            feeAmount,
            stakeDetails[msg.sender][stakeId].startTime,
            stakeDetails[msg.sender][stakeId].endTime,
            stakeToken.symbol()
        );
        for (uint256 i = 0; i < stakeId; i++) {
        if (block.timestamp <= stakeDetails[msg.sender][i].endTime) {
            continue; 
        }
        Stakes storage stk = stakeDetails[msg.sender][i];
        stk.claimTime = block.timestamp;
        stk.stakeAmount = 0;
    }
    nextStakeId[msg.sender]++;
}
  
     /// @dev Allows users to withdraw all first stake amount.
     /// Users cannot withdraw from frozen addresses.
     
function unStakeAll() external nonReentrant notFrozen(msg.sender) {
    if(checkValidityExpireAmount(msg.sender) == 0) {
        revert ZeroClaimAmount();
    }
    
    mapping(uint256 => Stakes) storage rStakeDetails = stakeDetails[msg.sender];
    uint256 totalStake = nextStakeId[msg.sender];
    uint256 totalWithdrawn;
    uint256 amount;

    for (uint256 i = 0; i < totalStake; i++) {
        Stakes storage rStake = rStakeDetails[i];
        if (block.timestamp <= rStake.endTime) {
            continue; 
        }
        
        amount = rStake.stakeAmount;

        rStake.stakeAmount = 0;
        rStake.claimTime = block.timestamp;

        if (amount > 0) {
            totalWithdrawn += amount;
         
        }
}

        stakeToken.safeTransfer(msg.sender, totalWithdrawn);
        emit Withdrawn( totalWithdrawn , stakeToken.symbol());
        totalTokenLocked -= totalWithdrawn;

}

     /// @dev Allows users to withdraw all stake 1  amount and burn all stake 2 token.
     /// Users cannot withdraw from frozen addresses.

function unStakeAndBurn() external nonReentrant notFrozen(msg.sender) {
    if(checkValidityExpireAmount2(msg.sender) == 0) {
        revert ZeroClaimAmount();
    }
    
   
     mapping(uint256 => Stakes2) storage rStakeDetails = stake2Details[msg.sender];
    uint256 totalStake = nextStake2Id[msg.sender];
    uint256 totalWithdrawn;
    uint256 amount;

    for (uint256 i = 0; i < totalStake; i++) {
        Stakes2 storage rStake = rStakeDetails[i];
        if (block.timestamp <= rStake.endTime) {
            continue; 
        }
        
        amount = rStake.stakeAmount;

        rStake.stakeAmount = 0;
        rStake.claimTime = block.timestamp;

        if (amount > 0) {
            totalWithdrawn += amount;
            
        }
    }
         if ((stakeToken.balanceOf(address(this) ) -  totalTokenLocked - totalFeeCollected) < totalWithdrawn) {
            revert InsufficientStakeTokenBalance();
        }

        totalTokenLocked2 -= totalWithdrawn;
        stake2Token.burn( totalWithdrawn);
        stakeToken.safeTransfer(msg.sender, totalWithdrawn); 
        emit Burn(totalWithdrawn ,stake2Token.symbol());
        emit Withdrawn(totalWithdrawn ,stakeToken.symbol());
    
}
   
   
     /// @dev Updates the wallet address associated with a user's stakes in first Token.
     /// Only the admin can call this function.
     /// @param _oldWallet The address of the user whose wallet is to be updated.
     /// @param _newWallet The new wallet address to be associated with the user's stakes.
    
function updateStakeWallet(address _oldWallet, address _newWallet)
    external
    onlyAdmin notFrozen(_newWallet)
{
    uint256 totalStake = nextStakeId[_oldWallet];
    uint256 Amount;
    uint256 feeAmount;
    uint256 netAmount;
    
    for (uint256 i = 0; i < totalStake; i++) {
        stakeDetails[_newWallet][i] = stakeDetails[_oldWallet][i];
        stakeDetails[_newWallet][i].user = _newWallet;
        Amount = stakeDetails[_newWallet][i].stakeAmount;
        feeAmount = (Amount * serviceFee) / 10000;
        netAmount = Amount - feeAmount;
        stakeDetails[_newWallet][i].stakeAmount = netAmount;
        totalFeeCollected += feeAmount;
        totalTokenLocked -= feeAmount;
        delete stakeDetails[_oldWallet][i];
    }
    nextStakeId[_newWallet] = totalStake;
    nextStakeId[_oldWallet] = 0;
}

     /// @dev Updates the wallet address associated with a user's stakes in second Token.
     /// Only the admin can call this function.
     /// @param _oldWallet The address of the user whose wallet is to be updated.
     /// @param _newWallet The new wallet address to be associated with the user's stakes.
    
function updateSecondStakeWallet(address _oldWallet, address _newWallet)
    external
    onlyAdmin notFrozen(_newWallet)
{
    uint256 totalStake = nextStake2Id[_oldWallet];
    uint256 Amount;
    uint256 feeAmount;
    uint256 netAmount;
    
    for (uint256 i = 0; i < totalStake; i++) {
        stake2Details[_newWallet][i] = stake2Details[_oldWallet][i];
        stake2Details[_newWallet][i].user = _newWallet;
        Amount = stake2Details[_newWallet][i].stakeAmount;
        feeAmount = (Amount * serviceFee) / 10000;
        netAmount = Amount - feeAmount;
        stake2Details[_newWallet][i].stakeAmount = netAmount;
        totalFeeCollected2 += feeAmount;
        totalTokenLocked2 -= feeAmount;
        delete stake2Details[_oldWallet][i];
    }
    nextStake2Id[_newWallet] = totalStake;
    nextStake2Id[_oldWallet] = 0;
}


     /// @dev Checks the total valid amount that can be claimed by a user.
     /// @param _user The address of the user to check for claimable amount.
     /// @return The total claimable amount for the user.

    function checkValidityExpireAmount(address _user)
        public
        view
        returns (uint256)
    {
        uint256 totalAmounts = 0;
        uint256 totalStake = nextStakeId[_user];
        for (uint256 i = 0; i < totalStake; i++) {
            if (block.timestamp <= stakeDetails[_user][i].endTime) {
                continue; 
            }
            totalAmounts += checkClaimExpiry(_user, i);
        }
        return totalAmounts;
    }
     /// @dev Checks the claimable amount for a specific stake.
     /// @param _user The address of the user whose stake is being checked.
     /// @param _stakeId The ID of the stake to check.
     /// @return The claimable amount for the specified stake.
    
    function checkClaimExpiry(address _user, uint256 _stakeId)
        public
        view
        returns (uint256)
    {
        if (block.timestamp >= stakeDetails[_user][_stakeId].endTime) {
            uint256 amount = stakeDetails[_user][_stakeId].stakeAmount;
            return amount;
        } else {
            return 0;
        }
    }
    /// Mapping of user addresses to their total stake amount
    function totalAmount(address _user) external view returns (uint256) {
    uint256 totalAmounts = 0;
    uint256 totalStake = nextStakeId[_user];
    for (uint256 i = 0; i < totalStake; i++) {
        totalAmounts += stakeDetails[_user][i].stakeAmount;
    }
    return totalAmounts;
}

     /// @dev Checks the total valid amount that can be claimed by a user.
     /// @param _user The address of the user to check for claimable amount.
     /// @return The total claimable amount for the user.

    function checkValidityExpireAmount2(address _user)
        public
        view
        returns (uint256)
    {
        uint256 totalAmounts = 0;
        uint256 totalStake = nextStake2Id[_user];
        for (uint256 i = 0; i < totalStake; i++) {
            if (block.timestamp <= stake2Details[_user][i].endTime) {
                continue; 
            }
            totalAmounts += checkClaimExpiry2(_user, i);
        }
        return totalAmounts;
    }
     /// @dev Checks the claimable amount for a specific stake.
     /// @param _user The address of the user whose stake 2 token is being checked.
     /// @param _stakeId The ID of the stake to check.
     /// @return The claimable amount for the specified stake.
    
    function checkClaimExpiry2(address _user, uint256 _stakeId)
        public
        view
        returns (uint256)
    {
        if (block.timestamp >= stake2Details[_user][_stakeId].endTime) {
            uint256 amount = stake2Details[_user][_stakeId].stakeAmount;
            return amount;
        } else {
            return 0;
        }
    }
    /// Mapping of user addresses to their  2 token total stake amount
    function totalAmount2(address _user) external view returns (uint256) {
    uint256 totalAmounts = 0;
    uint256 totalStake = nextStake2Id[_user];
    for (uint256 i = 0; i < totalStake; i++) {
        totalAmounts += stake2Details[_user][i].stakeAmount;
    }
    return totalAmounts;
}
   

 
     /// @dev Proposes and votes for the upgrade of the contract's implementation address.
     /// Only members of the DAO can call this function.

    function proposeAndVoteUpgrade()
        external
        onlyDAO
    {
        if(voted[msg.sender][proposedUpgradeContract]){
            revert AlreadyVoted();
        }
       if(minSigRequired == 0){
        revert MinimumSignatureNotSet();
       }
    
        voted[msg.sender][proposedUpgradeContract] = true;
        approvals[proposedUpgradeContract]++;
        emit UpgradeVote(msg.sender, proposedUpgradeContract);
        if (approvals[proposedUpgradeContract] >= minSigRequired) {
            upgradeToAndCall(proposedUpgradeContract, bytes(""));
        }
    }
 
     /// @dev Revokes a previous vote for the upgrade of the contract's implementation address.
     /// Only members of the DAO can call this function.
     /// @param _newImplementationAddress The address of the proposed implementation to revoke the vote from.

    function revokeVote(address _newImplementationAddress) external onlyDAO {
        if(!voted[msg.sender][_newImplementationAddress]){
            revert NotVotedBefore();
        }
        voted[msg.sender][_newImplementationAddress] = false;
        approvals[_newImplementationAddress]--;
        emit VoteRevoked(msg.sender, _newImplementationAddress);
    }


    function clearVotesForImplementation() internal  
    {
        approvals[proposedUpgradeContract] = 0;
        for (uint256 i = 0; i < topHolders.length; i++) {
            voted[topHolders[i]][proposedUpgradeContract] = false; 
        }
    }

     /// @dev Sets the list of owners and the minimum required signatures for DAO operations.
     /// Only the contract owner can call this function.
     /// @param newOwners The list of new owners for the DAO.
     /// @param sigRequired The minimum number of signatures required for DAO operations.
     /// @param _newImplentationAddress The address of the new contract implementation.

function setOwnersAndMinimumSignatures(
    address[] calldata newOwners,
    uint256 sigRequired,
    address _newImplentationAddress
) external onlyAdmin {
 if (_newImplentationAddress == address(0)) {
        revert InvalidImplementationAddress();
    }
    if (sigRequired == 0) {
        revert InvalidSignatureRequirement();
    }
    if (containsDuplicateOrZeroAddress(newOwners)) {
        revert DuplicateOrZeroAddressFound();
    }
    if(newOwners.length < sigRequired){
        revert SignatureLengthNotMatched();
    }

    clearVotesForImplementation();

    proposedUpgradeContract = _newImplentationAddress;
    topHolders = newOwners;
    minSigRequired = sigRequired;
    emit OwnersAndMinimumSignaturesSet(newOwners, sigRequired);
}

 /// @dev Checks if an array of addresses contains any duplicate or zero addresses.
 /// @param _addresses The array of addresses to be checked.
 /// @return A boolean indicating whether any duplicates or zero addresses are found.



function containsDuplicateOrZeroAddress(address[] calldata _addresses) internal pure returns (bool) {
    uint256 length = _addresses.length;
    for (uint256 i = 0; i < length; i++) {
        if (_addresses[i] == address(0)) {
            return true; // Found 0x000 address
        }
        for (uint256 j = i + 1; j < length; j++) {
            if (_addresses[i] == _addresses[j]) {
                return true; // Found duplicate address
            }
        }
    }
    return false; // No duplicates or 0x000 address found
}

     /// @dev Checks if an address exists in the top holders array.
     /// @param _owner The address to check for existence in the top holders array.
     /// @return True if the address exists in the array, false otherwise.

    function existsInArray(address _owner) public view returns (bool) {
    uint256 topHoldersLength = topHolders.length;
    for (uint256 i = 0; i < topHoldersLength; i++) {
        if (topHolders[i] == _owner) {
            return true;
        }
    }
    return false;
}


     /// @dev Adds or removes addresses from the freeze list.
     /// Only the admin can call this function.
     /// @param _freezeWallet The list of addresses to add or remove from the freeze list.
     /// @param _flag Boolean flag indicating whether to freeze or unfreeze the addresses.

    function addFreezeWallet(address[] calldata _freezeWallet, bool _flag)
        external
        onlyAdmin
    {
        for (uint256 i = 0; i < _freezeWallet.length; i++) {
            freezeList[_freezeWallet[i]] = _flag;
        }
        emit FreezeWalletUpdated(_freezeWallet, _flag);
    }

     /// @dev Allows the admin to withdraw collected fees.
     /// Only the admin can call this function.

    function feeWithdraw() external onlyAdmin {
        uint256 amount = totalFeeCollected;
        uint256 amount2 = totalFeeCollected2;
        totalFeeCollected = 0;
        totalFeeCollected2 = 0 ;
        stakeToken.safeTransfer(msg.sender, amount);
        emit FeeWithdrawn(msg.sender, amount);
        stake2Token.safeTransfer(msg.sender, amount2);
        emit FeeWithdrawn(msg.sender, amount2);
    }
   
     /// @dev Allows the contract owner to emergency withdraw the native currency (MATIC) from the contract.
     /// Only the contract owner can call this function.

    function emergencyWithdrawMatic() external onlyOwner {
        emit WithdrawNative(msg.sender, address(this).balance);
         AddressUpgradeable.sendValue(payable(msg.sender), address(this).balance);
    }
 
     /// @dev Allows the contract owner to emergency withdraw ERC20 tokens from the contract.
     /// Only the contract owner can call this function.
     /// @param _tokenAddress The address of the ERC20 token to withdraw.

    function emergencyWithdrawErc20(address _tokenAddress)
        external
        onlyOwner
    {
        IERC20Upgradeable token = IERC20Upgradeable(_tokenAddress);
        if (token == stakeToken) {
            uint256 availableBalance = token.balanceOf(address(this)) - 
            totalTokenLocked -
            totalFeeCollected;
            if (availableBalance > 0){
            token.safeTransfer(msg.sender, availableBalance);
            emit WithdrawToken(msg.sender, _tokenAddress, availableBalance);
            }
        }
         else if (token == stake2Token) {
            uint256 availableBalance2 = token.balanceOf(address(this)) - 
            totalTokenLocked2 -
            totalFeeCollected2;
            if (availableBalance2 > 0){
            token.safeTransfer(msg.sender, availableBalance2);
            emit WithdrawToken(msg.sender, _tokenAddress, availableBalance2);
            }
        } else {
             token.safeTransfer(msg.sender, token.balanceOf(address(this))); // Send available balance if stake token matches or if not enough balance
            emit WithdrawToken(msg.sender, _tokenAddress,token.balanceOf(address(this)));
        }
    }
     /// @dev Authorizes the upgrade to a new implementation address.
     /// Only the DAO can call this function.
     /// @param _newImplementation The address of the new implementation.
  
    function _authorizeUpgrade(address _newImplementation)
        internal
        override
        onlyDAO
    {
       if (approvals[proposedUpgradeContract] < minSigRequired){
            revert MinimumSignatureNotMet();
       }
        
        clearVotesForImplementation();
    }
}
