/**
 *Submitted for verification at polygonscan.com on 2024-07-06
*/

// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol
pragma solidity 0.8.18;

/**
 * @dev Library for reading and writing primitive types to specific storage slots.
 *
 * Storage slots are often used to avoid storage conflict when dealing with upgradeable contracts.
 * This library helps with reading and writing to such slots without the need for inline assembly.
 *
 * The functions in this library return Slot structs that contain a `value` member that can be used to read or write.
 */
 
library StorageSlotUpgradeable {
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


/**
 * @dev ERC-1967: Proxy Storage Slots. This interface contains the events defined in the ERC.
 *
 * _Available since v4.8.3._
 */
interface IERC1967Upgradeable {
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
}

// File: @openzeppelin/contracts-upgradeable/proxy/beacon/IBeaconUpgradeable.sol
// OpenZeppelin Contracts v4.4.1 (proxy/beacon/IBeacon.sol)
/**
 * @dev This is the interface that {BeaconProxy} expects of its beacon.
 */
interface IBeaconUpgradeable {
    /**
     * @dev Must return an address that can be used as a delegate call target.
     *
     * {BeaconProxy} will check that this address is a contract.
     */
    function implementation() external view returns (address);
}

// File: @openzeppelin/contracts-upgradeable/interfaces/draft-IERC1822Upgradeable.sol
// OpenZeppelin Contracts (last updated v4.5.0) (interfaces/draft-IERC1822.sol)
/**
 * @dev ERC1822: Universal Upgradeable Proxy Standard (UUPS) documents a method for upgradeability through a simplified
 * proxy whose upgrades are fully controlled by the current implementation.
 */
interface IERC1822ProxiableUpgradeable {
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

// File: @openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol
// OpenZeppelin Contracts (last updated v4.9.0) (proxy/utils/Initializable.sol)
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
     * @dev Indicates that the contract has been initialized.
     * @custom:oz-retyped-from bool
     */
    uint8 private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Triggered when the contract has been initialized or reinitialized.
     */
    event Initialized(uint8 version);

    /**
     * @dev A modifier that defines a protected initializer function that can be invoked at most once. In its scope,
     * `onlyInitializing` functions can be used to initialize parent contracts.
     *
     * Similar to `reinitializer(1)`, except that functions marked with `initializer` can be nested in the context of a
     * constructor.
     *
     * Emits an {Initialized} event.
     */
    modifier initializer() {
        bool isTopLevelCall = !_initializing;
        require(
            (isTopLevelCall && _initialized < 1) || (!AddressUpgradeable.isContract(address(this)) && _initialized == 1),
            "Initializable: contract is already initialized"
        );
        _initialized = 1;
        if (isTopLevelCall) {
            _initializing = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
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
     * WARNING: setting the version to 255 will prevent any future reinitialization.
     *
     * Emits an {Initialized} event.
     */
    modifier reinitializer(uint8 version) {
        require(!_initializing && _initialized < version, "Initializable: contract is already initialized");
        _initialized = version;
        _initializing = true;
        _;
        _initializing = false;
        emit Initialized(version);
    }

    /**
     * @dev Modifier to protect an initialization function so that it can only be invoked by functions with the
     * {initializer} and {reinitializer} modifiers, directly or indirectly.
     */
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
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
        require(!_initializing, "Initializable: contract is initializing");
        if (_initialized != type(uint8).max) {
            _initialized = type(uint8).max;
            emit Initialized(type(uint8).max);
        }
    }

    /**
     * @dev Returns the highest version that has been initialized. See {reinitializer}.
     */
    function _getInitializedVersion() internal view returns (uint8) {
        return _initialized;
    }

    /**
     * @dev Returns `true` if the contract is currently initializing. See {onlyInitializing}.
     */
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
}

// File: @openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol
// OpenZeppelin Contracts (last updated v4.9.0) (proxy/ERC1967/ERC1967Upgrade.sol)

/**
 * @dev This abstract contract provides getters and event emitting update functions for
 * https://eips.ethereum.org/EIPS/eip-1967[EIP1967] slots.
 *
 * _Available since v4.1._
 */
abstract contract ERC1967UpgradeUpgradeable is Initializable, IERC1967Upgradeable {
    function __ERC1967Upgrade_init() internal onlyInitializing {
    }

    function __ERC1967Upgrade_init_unchained() internal onlyInitializing {
    }
    // This is the keccak-256 hash of "eip1967.proxy.rollback" subtracted by 1
    bytes32 private constant _ROLLBACK_SLOT = 0x4910fdfa16fed3260ed0e7147f7cc6da11a60208b5b9406d12a635614ffd9143;

    /**
     * @dev Storage slot with the address of the current implementation.
     * This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1, and is
     * validated in the constructor.
     */
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    /**
     * @dev Returns the current implementation address.
     */
    function _getImplementation() internal view returns (address) {
        return StorageSlotUpgradeable.getAddressSlot(_IMPLEMENTATION_SLOT).value;
    }

    /**
     * @dev Stores a new address in the EIP1967 implementation slot.
     */
    function _setImplementation(address newImplementation) private {
        require(AddressUpgradeable.isContract(newImplementation), "ERC1967: new implementation is not a contract");
        StorageSlotUpgradeable.getAddressSlot(_IMPLEMENTATION_SLOT).value = newImplementation;
    }

    /**
     * @dev Perform implementation upgrade
     *
     * Emits an {Upgraded} event.
     */
    function _upgradeTo(address newImplementation) internal {
        _setImplementation(newImplementation);
        emit Upgraded(newImplementation);
    }

    /**
     * @dev Perform implementation upgrade with additional setup call.
     *
     * Emits an {Upgraded} event.
     */
    function _upgradeToAndCall(address newImplementation, bytes memory data, bool forceCall) internal {
        _upgradeTo(newImplementation);
        if (data.length > 0 || forceCall) {
            AddressUpgradeable.functionDelegateCall(newImplementation, data);
        }
    }

    /**
     * @dev Perform implementation upgrade with security checks for UUPS proxies, and additional setup call.
     *
     * Emits an {Upgraded} event.
     */
    function _upgradeToAndCallUUPS(address newImplementation, bytes memory data, bool forceCall) internal {
        // Upgrades from old implementations will perform a rollback test. This test requires the new
        // implementation to upgrade back to the old, non-ERC1822 compliant, implementation. Removing
        // this special case will break upgrade paths from old UUPS implementation to new ones.
        if (StorageSlotUpgradeable.getBooleanSlot(_ROLLBACK_SLOT).value) {
            _setImplementation(newImplementation);
        } else {
            try IERC1822ProxiableUpgradeable(newImplementation).proxiableUUID() returns (bytes32 slot) {
                require(slot == _IMPLEMENTATION_SLOT, "ERC1967Upgrade: unsupported proxiableUUID");
            } catch {
                revert("ERC1967Upgrade: new implementation is not UUPS");
            }
            _upgradeToAndCall(newImplementation, data, forceCall);
        }
    }

    /**
     * @dev Storage slot with the admin of the contract.
     * This is the keccak-256 hash of "eip1967.proxy.admin" subtracted by 1, and is
     * validated in the constructor.
     */
    bytes32 internal constant _ADMIN_SLOT = 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;

    /**
     * @dev Returns the current admin.
     */
    function _getAdmin() internal view returns (address) {
        return StorageSlotUpgradeable.getAddressSlot(_ADMIN_SLOT).value;
    }

    /**
     * @dev Stores a new address in the EIP1967 admin slot.
     */
    function _setAdmin(address newAdmin) private {
        require(newAdmin != address(0), "ERC1967: new admin is the zero address");
        StorageSlotUpgradeable.getAddressSlot(_ADMIN_SLOT).value = newAdmin;
    }

    /**
     * @dev Changes the admin of the proxy.
     *
     * Emits an {AdminChanged} event.
     */
    function _changeAdmin(address newAdmin) internal {
        emit AdminChanged(_getAdmin(), newAdmin);
        _setAdmin(newAdmin);
    }

    /**
     * @dev The storage slot of the UpgradeableBeacon contract which defines the implementation for this proxy.
     * This is bytes32(uint256(keccak256('eip1967.proxy.beacon')) - 1)) and is validated in the constructor.
     */
    bytes32 internal constant _BEACON_SLOT = 0xa3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50;

    /**
     * @dev Returns the current beacon.
     */
    function _getBeacon() internal view returns (address) {
        return StorageSlotUpgradeable.getAddressSlot(_BEACON_SLOT).value;
    }

    /**
     * @dev Stores a new beacon in the EIP1967 beacon slot.
     */
    function _setBeacon(address newBeacon) private {
        require(AddressUpgradeable.isContract(newBeacon), "ERC1967: new beacon is not a contract");
        require(
            AddressUpgradeable.isContract(IBeaconUpgradeable(newBeacon).implementation()),
            "ERC1967: beacon implementation is not a contract"
        );
        StorageSlotUpgradeable.getAddressSlot(_BEACON_SLOT).value = newBeacon;
    }

    /**
     * @dev Perform beacon upgrade with additional setup call. Note: This upgrades the address of the beacon, it does
     * not upgrade the implementation contained in the beacon (see {UpgradeableBeacon-_setImplementation} for that).
     *
     * Emits a {BeaconUpgraded} event.
     */
    function _upgradeBeaconToAndCall(address newBeacon, bytes memory data, bool forceCall) internal {
        _setBeacon(newBeacon);
        emit BeaconUpgraded(newBeacon);
        if (data.length > 0 || forceCall) {
            AddressUpgradeable.functionDelegateCall(IBeaconUpgradeable(newBeacon).implementation(), data);
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol
// OpenZeppelin Contracts (last updated v4.9.0) (proxy/utils/UUPSUpgradeable.sol)


/**
 * @dev An upgradeability mechanism designed for UUPS proxies. The functions included here can perform an upgrade of an
 * {ERC1967Proxy}, when this contract is set as the implementation behind such a proxy.
 *
 * A security mechanism ensures that an upgrade does not turn off upgradeability accidentally, although this risk is
 * reinstated if the upgrade retains upgradeability but removes the security mechanism, e.g. by replacing
 * `UUPSUpgradeable` with a custom implementation of upgrades.
 *
 * The {_authorizeUpgrade} function must be overridden to include access restriction to the upgrade mechanism.
 *
 * _Available since v4.1._
 */
abstract contract UUPSUpgradeable is Initializable, IERC1822ProxiableUpgradeable, ERC1967UpgradeUpgradeable {
    function __UUPSUpgradeable_init() internal onlyInitializing {
    }

    function __UUPSUpgradeable_init_unchained() internal onlyInitializing {
    }
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address private immutable __self = address(this);

    /**
     * @dev Check that the execution is being performed through a delegatecall call and that the execution context is
     * a proxy contract with an implementation (as defined in ERC1967) pointing to self. This should only be the case
     * for UUPS and transparent proxies that are using the current contract as their implementation. Execution of a
     * function through ERC1167 minimal proxies (clones) would not normally pass this test, but is not guaranteed to
     * fail.
     */
    modifier onlyProxy() {
        require(address(this) != __self, "Function must be called through delegatecall");
        require(_getImplementation() == __self, "Function must be called through active proxy");
        _;
    }

    /**
     * @dev Check that the execution is not being performed through a delegate call. This allows a function to be
     * callable on the implementing contract but not through proxies.
     */
    modifier notDelegated() {
        require(address(this) == __self, "UUPSUpgradeable: must not be called through delegatecall");
        _;
    }

    /**
     * @dev Implementation of the ERC1822 {proxiableUUID} function. This returns the storage slot used by the
     * implementation. It is used to validate the implementation's compatibility when performing an upgrade.
     *
     * IMPORTANT: A proxy pointing at a proxiable contract should not be considered proxiable itself, because this risks
     * bricking a proxy that upgrades to it, by delegating to itself until out of gas. Thus it is critical that this
     * function revert if invoked through a proxy. This is guaranteed by the `notDelegated` modifier.
     */
    function proxiableUUID() external view virtual override notDelegated returns (bytes32) {
        return _IMPLEMENTATION_SLOT;
    }

    /**
     * @dev Upgrade the implementation of the proxy to `newImplementation`.
     *
     * Calls {_authorizeUpgrade}.
     *
     * Emits an {Upgraded} event.
     *
     * @custom:oz-upgrades-unsafe-allow-reachable delegatecall
     */
    function upgradeTo(address newImplementation) public virtual onlyProxy {
        _authorizeUpgrade(newImplementation);
        _upgradeToAndCallUUPS(newImplementation, new bytes(0), false);
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
        _upgradeToAndCallUUPS(newImplementation, data, true);
    }

    /**
     * @dev Function that should revert when `msg.sender` is not authorized to upgrade the contract. Called by
     * {upgradeTo} and {upgradeToAndCall}.
     *
     * Normally, this function will use an xref:access.adoc[access control] modifier such as {Ownable-onlyOwner}.
     *
     * ```solidity
     * function _authorizeUpgrade(address) internal override onlyOwner {}
     * ```
     */
    function _authorizeUpgrade(address newImplementation) internal virtual;

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

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

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol

// OpenZeppelin Contracts (last updated v4.9.0) (access/Ownable.sol)

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function __Ownable_init() internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __Ownable_init_unchained() internal onlyInitializing {
        _transferOwnership(_msgSender());
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
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
       require(owner() == _msgSender(), "Ownable: caller is not the owner");
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
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
// File: @openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20PermitUpgradeable.sol
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/extensions/IERC20Permit.sol)

/**
 * @dev Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
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
}

// File: @openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol

// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/utils/SafeERC20.sol)

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
     * non-reverting calls are assumed to be successful. Compatible with tokens that require the approval to be set to
     * 0 before setting it to a non-zero value.
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

abstract contract ReentrancyGuard {
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
    uint256 private constant NOT_ENTERED = 1;
    uint256 private constant ENTERED = 2;

    uint256 private _status;

    /**
     * @dev Unauthorized reentrant call.
     */
    error ReentrancyGuardReentrantCall();

    constructor() {
        _status = NOT_ENTERED;
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
        // On the first call to nonReentrant, _status will be NOT_ENTERED
        if (_status == ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }

        // Any calls to nonReentrant after this point will fail
        _status = ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}

/// @title Hash Interface
/// @notice Interface for a contract implementing a function to verify a whitelist hash.

library MerkleProof {
    error MerkleProofInvalidMultiproof();
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        return processProof(proof, leaf) == root;
    }
    function verifyCalldata(bytes32[] calldata proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        return processProofCalldata(proof, leaf) == root;
    }
    function processProof(bytes32[] memory proof, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedHash = _hashPair(computedHash, proof[i]);
        }
        return computedHash;
    }
    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedHash = _hashPair(computedHash, proof[i]);
        }
        return computedHash;
    }
    function multiProofVerify(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32 root,
        bytes32[] memory leaves
    ) internal pure returns (bool) {
        return processMultiProof(proof, proofFlags, leaves) == root;
    }
    function multiProofVerifyCalldata(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32 root,
        bytes32[] memory leaves
    ) internal pure returns (bool) {
        return processMultiProofCalldata(proof, proofFlags, leaves) == root;
    }
    function processMultiProof(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory leaves
    ) internal pure returns (bytes32 merkleRoot) {
        uint256 leavesLen = leaves.length;
        uint256 proofLen = proof.length;
        uint256 totalHashes = proofFlags.length;
        // Check proof validity.
        if (leavesLen + proofLen != totalHashes + 1) {
            revert MerkleProofInvalidMultiproof();
        }
        bytes32[] memory hashes = new bytes32[](totalHashes);
        uint256 leafPos = 0;
        uint256 hashPos = 0;
        uint256 proofPos = 0;
        for (uint256 i = 0; i < totalHashes; i++) {
            bytes32 a = leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++];
            bytes32 b = proofFlags[i]
                ? (leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++])
                : proof[proofPos++];
            hashes[i] = _hashPair(a, b);
        }
        if (totalHashes > 0) {
            if (proofPos != proofLen) {
                revert MerkleProofInvalidMultiproof();
            }
            unchecked {
                return hashes[totalHashes - 1];
            }
        } else if (leavesLen > 0) {
            return leaves[0];
        } else {
            return proof[0];
        }
    }
    function processMultiProofCalldata(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32[] memory leaves
    ) internal pure returns (bytes32 merkleRoot) {
        uint256 leavesLen = leaves.length;
        uint256 proofLen = proof.length;
        uint256 totalHashes = proofFlags.length;
        // Check proof validity.
        if (leavesLen + proofLen != totalHashes + 1) {
            revert MerkleProofInvalidMultiproof();
        }
        bytes32[] memory hashes = new bytes32[](totalHashes);
        uint256 leafPos = 0;
        uint256 hashPos = 0;
        uint256 proofPos = 0;
        for (uint256 i = 0; i < totalHashes; i++) {
            bytes32 a = leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++];
            bytes32 b = proofFlags[i]
                ? (leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++])
                : proof[proofPos++];
            hashes[i] = _hashPair(a, b);
        }
        if (totalHashes > 0) {
            if (proofPos != proofLen) {
                revert MerkleProofInvalidMultiproof();
            }
            unchecked {
                return hashes[totalHashes - 1];
            }
        } else if (leavesLen > 0) {
            return leaves[0];
        } else {
            return proof[0];
        }
    }
    /**
     * @dev Sorts the pair (a, b) and hashes the result.
     */
    function _hashPair(bytes32 a, bytes32 b) private pure returns (bytes32) {
        return a < b ? _efficientHash(a, b) : _efficientHash(b, a);
    }
    /**
     * @dev Implementation of keccak256(abi.encode(a, b)) that doesn't allocate or expand memory.
     */
    function _efficientHash(bytes32 a, bytes32 b) private pure returns (bytes32 value) {
        /// @solidity memory-safe-assembly
        assembly {
            mstore(0x00, a)
            mstore(0x20, b)
            value := keccak256(0x00, 0x40)
        }
    }
}
library StringUtils {
    function uint256ToString(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
/// @dev Verifies the whitelist hash for a user from Factory Contract.
interface hashInterface {
    function verifyWhiteListHash(bytes32[] calldata proof,address user) external view returns (bool);

}
/**
 * @title ProjectSale
 * @dev Contract for managing a public sale event.
 */

contract projectsale is  ReentrancyGuard {
//Safe ERC20 Implementation for ERC20 transfers
using SafeERC20Upgradeable for IERC20Upgradeable;
///Using the StringUtils library to extend functionality for uint256.
using StringUtils for uint256;
/// Project Contract fees.
Fee public fees;
/// Address for buyBackAndReclaim operations.
address public buyBackAddress;
/// Address for buyBackAndReclaim operations.
address public reClaimAddress;
/// Hash for allocation details.
bytes32 public allocationHash;
/// Hash for airdrop details.
bytes32 public airdropHash;
/// Details of the project.
projectDetails public project;
/// Total usdt deposited
uint256 public totalUsdtDeposited ;
/// Total usdt raised
uint256 public totalUsdtRaised ;
/// Total usdt withdraw
uint256 public totalUsdtWithdrawn ;
/// Remaining liquidity of the token.
uint256 public tokenRemainingLiquidity;
/// Total amount of tokens purchased.
uint256 public totalPurchasedToken;
/// the  total wallet address first deposit in contract
uint256 public totalNoOfUserWallet ;
/// Total Token Liquidity
uint256 public tokenLiquidity;
/// Total users USDT remaining 
uint256 public excessDeposit ;
///  Represents the total distribution of tokens for the airdrop.
uint256 public totalAirdropTokenDistribution;
// The denominator used for fee calculations to ensure precision
uint256 constant feeDenominator = 1000;
// The scale used for percentage calculations to handle fractional percentages
uint256 constant percentageScale = 100;
/// notice This contract manages interactions with the factory contract implementing the hashInterface.
///  This variable allows access to functions defined in the hashInterface.
hashInterface public factoryContract;



/// Mapping of user addresses to their data details.
mapping(address => userData) public userDetails;
/// Mapping of user addresses to their next stake ID for 1 token
mapping(address => uint256) public nextDepositId;
/// Mapping of user addresses to their data details.
mapping(address => mapping(uint256 => depositData)) public depositDetails;
/// Mapping of user addresses to their airdrop details.
mapping(address => airdropData) public airdropUser;

/// Struct for project details.
        struct projectDetails {
        address token;
        address usdt;
        uint256 tokenPriceInWei;
        uint256 startDate;
        uint256 endDate;
        uint256 cliffing;
        uint256 vestingInterval;
        uint256 vestingPercentage;
        uint256 tgeDate;
        uint256 tgePercentage;
        address owner;
    }
/// Struct for fee details.
    struct Fee {
        uint256 depositFee;
        uint256 withdrawFee;
        uint256 claimFee;
        uint256 totalDepositFee ;
        uint256 totalWithdrawFee ;
        uint256 totalClaimFee ;
    }


    /// Struct for usdt deposit data.
    struct depositData {
     string symbol;
     uint256 depositedUsdt;
     uint256 depositTime ;
    }
    
/// Struct for user data.

    struct userData {
        bool activate;
        uint256 allocation;
        uint256 purchasedToken;
        uint256 depositedUsdt;
        uint256 purchasedUsdt;
        uint256 refundableUsdt;
        uint256 totalClaimed;
        uint256 lastClaimedTime;
        uint256 vestingPercentage;
        uint256 tgePercentage;
        uint256 cliffing;
        uint256 vestingInterval;
        uint256 tgeClaimed;
    }
/// Struct for airdrop data.
    struct airdropData{
     uint256 amount ;
     bool activate ;
    }
// Modifier to restrict access to only the contract ProjectOwner 
        modifier onlyProjectOwner() {
       if (project.owner != msg.sender) {
        revert  InvalidProjectOwnerAddress();
    }
        _;
    }



// Event emitted when fees are set
event FeesSet(uint256 depositFee, uint256 withdrawFee, uint256 claimFee);

// Event emitted when USDT is deposited
event UsdtDeposited(address indexed user, uint256 usdtAmount, uint256 totalAmount, uint256 usdtFee);

// Event emitted when USDT is withdrawn
event UsdtWithdrawn(address indexed user, uint256 amountAfterFee, uint256 usdtFee);

// Event emitted when a user is activated
event UserActivated(address indexed user, uint256 tokenAmount);

// Event emitted when a user's participation in the airdrop is activated
event UserAirdropActivated(address indexed user, uint256 tokenAmount);

// Event emitted when a user claims their allocated tokens from the airdrop
event AirdropClaimed(address indexed user, uint256 amount);

// Event emitted when liquidity is added to the contract
event LiquidityAdded(address indexed owner, uint256 amount);

// Event emitted when fees are withdrawn
event FeesWithdrawn(address indexed owner, uint256 totalDepositFee, uint256 totalWithdrawFee, uint256 totalClaimFee);


// Event emitted when tokens are claimed
event Claimed(address indexed user, uint256 amount, uint256 claimFees);

// Event emitted when a buyback address is added
event BuyBackOrReclaimAddress(address indexed beneficiary);

// Event emitted when tokens are bought back and reclaimed
event tokensBuyBackandReclaim(address token , address indexed user, uint256 amount);
// Define an event for hash addition
event HashAdded(bytes32 indexed hash, uint8 indexed index);

// Event emitted when USDT is withdrawn
event USDTWithdrawn(address indexed beneficiary, uint256 amount);
// Event to log token withdrawal
event WithdrawToken(address indexed beneficiary, address indexed tokenAddress, uint256 amount);    
// Initializes the contract with specified parameters


// Custom error message for depositUsdt function
error DepositPeriodEnded();

// Custom error message for withdrawExcessUsdt function
error DepositPeriodNotEnded();

// Custom error message for user not activated
error UserNotActivated();

// Custom error message for no amount to refund
error NoAmountToRefund();

// Custom error message for insufficient USDT balance
error InsufficientUsdtBalance();

// Custom error message for no tokens to claim
error NoTokensToClaim();

// Custom error message for TGE claim not claimed
error TgeClaimNotClaimed();

// Custom error message for claim not available
error ClaimNotAvailable();

// Custom error message for user not having any claimable balance
error NoClaimableBalance();

// Custom error message for zero address not allowed
error ZeroAddressNotAllowed();

// Custom error message for unauthorized access
error UnauthorizedAccess();
// Custom error message for public sale not ended
error PublicSaleNotEnded();
// Custom error message for invalid token address
error InvalidTokenAddress();
// Custom error message for invalid Project Owner
error InvalidProjectOwnerAddress();
// Custom error message for not set usdt rate
error EquivalentUsdtCalculationFailed();
// Custom error message for user already activated
error UserAlreadyActivated();

// Event emitted when allocation is added for an address.
event AllocationAdded(address indexed allocationAddress);

    constructor(
        address _token,
        address _usdt,
        uint256 _tokenPriceInWei,
        uint256 _startDate,
        uint256 _endDate,
        uint256 _cliffing,
        uint256 _vestingInterval,
        uint256 _vestingPercentage,
        uint256 _tgeDate,
        uint256 _tgePercentage,
        address _owner,
        address _factory
    ) {
        
        project.token = _token;
        project.usdt= _usdt;
        project.tokenPriceInWei= _tokenPriceInWei;
        project.startDate= _startDate;
        project.endDate= _endDate;
        project.cliffing= _cliffing;
        project.vestingInterval= _vestingInterval;
        project.vestingPercentage= _vestingPercentage;
        project.tgeDate= _tgeDate;
        project.tgePercentage= _tgePercentage;
        factoryContract = hashInterface(_factory);
        project.owner = _owner ;
        }
    
/// @dev Sets the fees for deposit, withdrawal, and claim operations.
/// @param _depositFee The fee percentage for deposits.
/// @param _withdrawFee The fee percentage for withdrawals.
/// @param _claimFee The fee percentage for claims.
function setFees(uint256 _depositFee, uint256 _withdrawFee, uint256 _claimFee) external onlyProjectOwner {
    fees.depositFee = _depositFee;
    fees.withdrawFee = _withdrawFee;
    fees.claimFee = _claimFee;
    emit FeesSet(_depositFee, _withdrawFee, _claimFee);
}

/// @dev Allows users to deposit USDT into the contract during the deposit period.
/// @param _usdtamount The amount of USDT to deposit.
function depositUsdt(uint256 _usdtamount) external {
if (block.timestamp >= project.endDate) {
        revert DepositPeriodEnded();
    }
     uint256 usdtFee = (_usdtamount * fees.depositFee) / feeDenominator;
    uint256 totalAmount = _usdtamount + usdtFee;
        if (userDetails[msg.sender].depositedUsdt == 0) {
        totalNoOfUserWallet += 1;
    }
    uint256 depositId = nextDepositId[msg.sender];
    userDetails[msg.sender].depositedUsdt += _usdtamount;
    depositDetails[msg.sender][depositId] = depositData(IERC20Upgradeable(project.usdt).symbol(),totalAmount,block.timestamp);
    totalUsdtDeposited += _usdtamount;
    fees.totalDepositFee += usdtFee;
    nextDepositId[msg.sender]++;
    IERC20Upgradeable(project.usdt).safeTransferFrom(msg.sender,address(this),totalAmount);
    emit UsdtDeposited(msg.sender, _usdtamount, totalAmount, usdtFee);
}


/// @dev Allows the project owner to add allocation for a specific address.
/// @param _address Array of addresses to allocate tokens to.
/// @param _tgePercentage  for that  users
/// @param  _cliffing for  that  users  
/// @param   _vestingPercentage for that  users  
function addAddresses(
    address[] calldata _address, 
    uint256 _tgePercentage, 
    uint256 _cliffing, 
    uint256 _vestingPercentage
)   external onlyProjectOwner {
    require(_address.length > 0, "No allocations to add");
    require(_tgePercentage + _vestingPercentage <= 100000, "TGE and vesting percentages cannot exceed 100");
    for (uint256 i = 0; i < _address.length; i++) {
        address allocation = _address[i];
        require(allocation != address(0), "Invalid address");
        require(userDetails[allocation].activate ,"some user are not activated" ) ;
        userDetails[allocation].lastClaimedTime = project.endDate + _cliffing;
        userDetails[allocation].tgePercentage = _tgePercentage;
        userDetails[allocation].vestingPercentage = _vestingPercentage;
        userDetails[allocation].cliffing = _cliffing;
        emit AllocationAdded(allocation);
    }
}



/// @dev Returns the total amount of USDT raised so far.
/// This function calculates the possible USDT raise based on the token liquidity and token price,
/// and returns the lesser of the total USDT deposited or the possible USDT raise.
/// @return The total amount of USDT raised.
function viewTotalRaisedUsdt() public view returns (uint256) {
    uint8 tokenDecimals = IERC20Upgradeable(project.token).decimals();
    uint8 usdtDecimals = IERC20Upgradeable(project.usdt).decimals();
    uint256 totalUsdtRaisePossible = (tokenLiquidity * project.tokenPriceInWei)/10**(18  + tokenDecimals - usdtDecimals);
    if (totalUsdtDeposited < totalUsdtRaisePossible) {
        return totalUsdtDeposited;
    } else {
        return totalUsdtRaisePossible;
    }
}



/// @dev Function to withdraw USDT from the contract.
/// @param _beneficiary The address to receive the USDT.
function withdrawUSDT(address _beneficiary  ) external onlyProjectOwner {
require(allocationHash != 0x0000000000000000000000000000000000000000000000000000000000000000, "First set allocation hash");
 require(_beneficiary != address(0), "Beneficiary address cannot be zero");
        if (block.timestamp < project.endDate) {
        revert PublicSaleNotEnded();
    }
        uint256 withdrawableUsdt = totalUsdtDeposited - excessDeposit - (fees.totalDepositFee + fees.totalWithdrawFee);
        require(withdrawableUsdt > 0, "Amount must be greater than 0");
        totalUsdtWithdrawn += withdrawableUsdt;

        IERC20Upgradeable(project.usdt).safeTransfer(_beneficiary, withdrawableUsdt);
        emit USDTWithdrawn(_beneficiary, withdrawableUsdt);
}



/// @dev Allows users to withdraw excess USDT after the deposit period has ended.
/// @param proof The hexadecimal representation of the Merkle proof.

function withdrawExcessUsdt( bytes32[] calldata proof) external nonReentrant {
    require(factoryContract.verifyWhiteListHash(proof , msg.sender) == true,"User is not whiteListed");
    if (block.timestamp <= project.endDate) {
        revert DepositPeriodNotEnded();
    }
    if (!userDetails[msg.sender].activate) {
        revert UserNotActivated();
    }

    uint256 remainingUsdt = userDetails[msg.sender].depositedUsdt - calculateUsdtPerToken(userDetails[msg.sender].purchasedToken);
    if (remainingUsdt == 0) {
        revert NoAmountToRefund();
    }

   uint256 usdtFee = (remainingUsdt * fees.withdrawFee) / feeDenominator;
    uint256 amountAfterFee = remainingUsdt - usdtFee;

    if (amountAfterFee == 0) {
        revert InsufficientUsdtBalance();
    }

    totalUsdtWithdrawn += amountAfterFee;
    userDetails[msg.sender].depositedUsdt -= remainingUsdt;
    userDetails[msg.sender].refundableUsdt = 0;
    fees.totalWithdrawFee += usdtFee;
        IERC20Upgradeable(project.usdt).safeTransfer(
        msg.sender,
        amountAfterFee
    );
    emit UsdtWithdrawn(msg.sender, amountAfterFee, usdtFee);
}


/// @dev Allows users to activate their participation in the project and allocate tokens based on the deposited USDT.
/// @param _tokenAmount The amount of tokens to allocate.
/// @param proof The hexadecimal representation of the Merkle proof.
function userActivate(uint256 _tokenAmount , bytes32[] calldata proof) external {
        if (userDetails[msg.sender].activate) {
        revert UserAlreadyActivated();
    }
    require(verifyAllocationHash(proof,msg.sender, _tokenAmount), "The allocation amount passed is not correct");
           if (project.endDate >= block.timestamp) {
        revert DepositPeriodNotEnded();
    }
        userDetails[msg.sender].allocation = _tokenAmount;
        uint256 maxCostInUsdt = calculateUsdtPerToken(_tokenAmount);
        if (maxCostInUsdt < userDetails[msg.sender].depositedUsdt) //user deposited more than allocation
        {
        userDetails[msg.sender].purchasedUsdt = maxCostInUsdt;
        userDetails[msg.sender].refundableUsdt = userDetails[msg.sender].depositedUsdt - maxCostInUsdt;
        }
        else //user deposited less than allocation
        {
        userDetails[msg.sender].purchasedUsdt = userDetails[msg.sender].depositedUsdt;
        userDetails[msg.sender].refundableUsdt = 0;
        }
        userDetails[msg.sender].purchasedToken = calculateTokenAmountPerUsdt(userDetails[msg.sender].purchasedUsdt);
        totalPurchasedToken += userDetails[msg.sender].purchasedToken ;
        totalUsdtRaised += userDetails[msg.sender].purchasedUsdt ;
        userDetails[msg.sender].lastClaimedTime =
            project.endDate +
            project.cliffing;
            userDetails[msg.sender].tgePercentage =
            project.tgePercentage;
            userDetails[msg.sender].vestingPercentage  =
            project.vestingPercentage ;
        userDetails[msg.sender].vestingInterval =
            project.vestingInterval;
        userDetails[msg.sender].cliffing =
            project.cliffing;
        userDetails[msg.sender].activate = true;
        emit UserActivated(msg.sender, _tokenAmount);
    }

/// @dev View function to check if a user is activated in the project.
/// @param _user The address of the user to check.
/// @return Whether the user is activated or not.

    function viewUserActivation(address _user) external  view returns (bool){
        return userDetails[_user].activate;
    }
/// @dev Verifies the validity of an airdrop hash.
/// @param proof The proof elements.
/// @param user The user hash.
/// @param amount The index.
/// @return Whether the hash is valid.

        function verifyAirdropHash(
        bytes32[] calldata proof,
        address user,
        uint256 amount
    ) public view returns (bool ) {
        string memory stringAmount = amount.uint256ToString() ;
        bytes32 leaf = keccak256(abi.encodePacked(user, stringAmount));
        return (MerkleProof.verify(proof, airdropHash, leaf) );
    }

/// @dev Verifies the validity of an allocation hash.
/// @param proof The proof elements.
/// @param user The user hash.
/// @param amount The index.
/// @return Whether the hash is valid.

        function verifyAllocationHash(
        bytes32[] calldata proof,
        address user,
        uint256 amount
    ) public view returns (bool ) {
        string memory stringAmount = amount.uint256ToString() ;
        bytes32 leaf = keccak256(abi.encodePacked(user, stringAmount));
        return (MerkleProof.verify(proof, allocationHash, leaf) );
    }

/// @dev Allows the contract owner to add allocation or airdrop hashes.
/// @param _Hash The hash to be added.
/// @param index The index indicating whether it's an allocation hash (0) or an airdrop hash (1).

    function addAllocationAndAirdropHash(bytes32 _Hash, uint8 index , uint256 _excessDeposit) external onlyProjectOwner {
        if (project.endDate >= block.timestamp) {
        revert DepositPeriodNotEnded();
    }
       if(index == 0) {
        allocationHash = _Hash;
        excessDeposit = _excessDeposit ;
    } else if(index == 1) {
        airdropHash = _Hash;
    }
        emit HashAdded(_Hash, index);
    }

    
/// @dev Allows users to activate their participation in the airdrop.
/// @param _tokenAmount The amount of tokens to allocate for the airdrop.
/// @param proof The hexadecimal representation of the Merkle proof.

function userAirdropActivate(uint256 _tokenAmount ,bytes32[] calldata proof ) external {
        if (airdropUser[msg.sender].activate) {
        revert UserAlreadyActivated();
    }
     require(verifyAirdropHash(proof,msg.sender, _tokenAmount), "The allocation amount passed is not correct");
      if (project.endDate >= block.timestamp) {
        revert DepositPeriodNotEnded();
    }
    airdropUser[msg.sender].amount += _tokenAmount;
    airdropUser[msg.sender].activate = true;
    emit UserAirdropActivated(msg.sender, _tokenAmount);
}

/// @dev View function to check the amount of tokens available for airdrop claim by a user.
/// @param _user The address of the user to check.
/// @return The amount of tokens available for claim.
function viewAirdropClaimAmount(address _user) public view returns (uint256) {
    if (!airdropUser[_user].activate || project.tgeDate > block.timestamp) {
        return 0;
    } else {
        return airdropUser[_user].amount;
    }
}

/// @dev Allows users to claim their allocated tokens from the airdrop.
function airdropClaim() external nonReentrant {
    uint256 amount = viewAirdropClaimAmount(msg.sender);
    require(amount > 0, "Airdrop claim not available");
    if (airdropUser[msg.sender].amount == 0) {
        revert NoTokensToClaim();
    }
    uint256 amountToClaim = airdropUser[msg.sender].amount;
    IERC20Upgradeable(project.token).safeTransfer(msg.sender, amountToClaim);
    emit AirdropClaimed(msg.sender, amountToClaim);
    tokenRemainingLiquidity -= amountToClaim;
    totalAirdropTokenDistribution += amountToClaim; 
    airdropUser[msg.sender].amount = 0;
  
}

/// @dev Allows the owner to add liquidity to the contract.
/// @param _amount The amount of tokens to add as liquidity.
function addLiquidity(uint256 _amount) external onlyProjectOwner{
    IERC20Upgradeable(project.token).safeTransferFrom(
        msg.sender,
        address(this),
        _amount
    );
    tokenLiquidity += _amount ;
    tokenRemainingLiquidity += _amount;
    emit LiquidityAdded(msg.sender, _amount);
}

/// @dev Allows the owner to withdraw all accumulated fees.
function withdrawAllFee() external  onlyProjectOwner{
  uint256 depositFee = fees.totalDepositFee;
    uint256 withdrawFee = fees.totalWithdrawFee;
    uint256 claimFee = fees.totalClaimFee;

    if (depositFee > 0) {
        totalUsdtWithdrawn += depositFee;
        IERC20Upgradeable(project.usdt).safeTransfer(msg.sender, depositFee);
        fees.totalDepositFee = 0;
    }
    if (withdrawFee > 0) {
        totalUsdtWithdrawn += withdrawFee;
        IERC20Upgradeable(project.usdt).safeTransfer(msg.sender, withdrawFee);
        fees.totalWithdrawFee = 0;
    }
    if (claimFee > 0) {
        IERC20Upgradeable(project.token).safeTransfer(msg.sender, claimFee);
        fees.totalClaimFee = 0;
    }
    emit FeesWithdrawn(msg.sender, depositFee, withdrawFee, claimFee);
}

/// @dev Allows users to claim tokens allocated for TGE (Token Generation Event).
/// @param proof The hexadecimal representation of the Merkle proof.
function tgeClaim(bytes32[] calldata proof) external nonReentrant {
    require(factoryContract.verifyWhiteListHash(proof , msg.sender),"User is not whiteListed");
    (uint256 amount, uint256 claimFees) = viewTgeClaim(msg.sender);
    require(amount > 0, "TGE claim not available");
    require(userDetails[msg.sender].tgeClaimed == 0, "Already claimed TGE");
    uint256 tokenClaim = amount + claimFees ;
    fees.totalClaimFee += claimFees ;
    tokenRemainingLiquidity -= amount;
    userDetails[msg.sender].totalClaimed += tokenClaim;
    userDetails[msg.sender].tgeClaimed += tokenClaim;
    IERC20Upgradeable(project.token).safeTransfer(msg.sender, amount );
    emit Claimed(msg.sender, amount, claimFees);
}


     /// @dev View function to calculate the claimable amount for the TGE (Token Generation Event).
     /// @param userAddress The address of the user to check.
     /// @return amount The claimable amount for the TGE.
     /// @return claimFee The claim Fee amount for the TGE.

      function viewTgeClaim(address userAddress) public view returns (uint256 amount, uint256 claimFee) {
     if (!userDetails[userAddress].activate || userDetails[userAddress].tgeClaimed > 0 || userDetails[userAddress].totalClaimed == userDetails[userAddress].purchasedToken) {
        return (0, 0);
    }
    uint256 claimAmount;

    // Check if TGE date has passed and user has not claimed yet
    if (  project.tgeDate  < block.timestamp && userDetails[userAddress].tgeClaimed == 0) {
        claimAmount = (userDetails[userAddress].tgePercentage * userDetails[userAddress].purchasedToken) / (percentageScale * 1000);
        claimFee = (claimAmount * fees.claimFee) / feeDenominator;
        amount = claimAmount - claimFee;
        return (amount, claimFee);
    }
    return (0, 0);
    }

   /// @dev Allows users to claim their allocated tokens.
   /// @param proof The hexadecimal representation of the Merkle proof.
    function claim(bytes32[] calldata proof) external nonReentrant {
    require(factoryContract.verifyWhiteListHash(proof , msg.sender) == true,"User is not whiteListed");
    require(block.timestamp >= userDetails[msg.sender].lastClaimedTime + userDetails[msg.sender].vestingInterval, "Claiming not allowed yet");
   require(userDetails[msg.sender].tgeClaimed != 0 || userDetails[msg.sender].vestingPercentage == 100000, "TgeClaimNotClaimed() or vesting percentage is not 100");
    (uint256 amount, uint256 claimFees) = viewClaim(msg.sender);
    if (amount == 0) {
        revert ClaimNotAvailable();
    }
    if (userDetails[msg.sender].purchasedToken == 0) {
        revert NoClaimableBalance();
    }

            uint256 tokenClaim = amount + claimFees ;
            IERC20Upgradeable(project.token).safeTransfer(msg.sender, amount );
            emit Claimed(msg.sender, amount, claimFees);
            fees.totalClaimFee += claimFees ;
            tokenRemainingLiquidity -= amount;
            userDetails[msg.sender].totalClaimed += tokenClaim;
            userDetails[msg.sender].lastClaimedTime = block.timestamp;
          
        }


/**
 * @dev Calculates the amount of tokens left after the sale ends.
 * @return The amount of tokens left.
 */
function afterSaleEndTokenLeft() public view returns (uint256){
    uint256 excessDepositToken =  calculateTokenAmountPerUsdt(excessDeposit );
    uint256 raisedToken = calculateTokenAmountPerUsdt(viewTotalRaisedUsdt()) ;
    uint256 amount = tokenLiquidity - raisedToken - excessDepositToken;
    return amount ;
}


/**
 * @dev View function to calculate the claimable amount and claim fees for a user.
 * @param userAddress The address of the user to check.
 * @return amount The claimable amount for the user.
 * @return claimFees The fees deducted from the claimable amount.
 */


function viewClaim(address userAddress) public view returns (uint256 amount, uint256 claimFees) {
    if (!userDetails[userAddress].activate || userDetails[userAddress].totalClaimed == userDetails[userAddress].purchasedToken) {
        return (0, 0);
    }

    uint256 interval = 0;
    uint256 lastClaimTimestamp = userDetails[userAddress].lastClaimedTime;
    uint256 claimAmount = 0;

    // Calculate the number of full intervals since the last claim
    if ((lastClaimTimestamp + userDetails[userAddress].vestingInterval) < block.timestamp) {
        interval = (block.timestamp - lastClaimTimestamp) / userDetails[userAddress].vestingInterval;
        
        // Calculate the claim amount based on the number of intervals and the vesting percentage
        uint256 totalVestedAmount = (userDetails[userAddress].purchasedToken - userDetails[userAddress].tgeClaimed) * userDetails[userAddress].vestingPercentage / (percentageScale * 1000);
        claimAmount = totalVestedAmount * interval;

        // Cap the claim amount to not exceed the remaining tokens to be claimed
        if ((userDetails[userAddress].totalClaimed + claimAmount) > userDetails[userAddress].purchasedToken) {
            claimAmount = userDetails[userAddress].purchasedToken - userDetails[userAddress].totalClaimed;
        }

        // Calculate claim fees
        claimFees = (claimAmount * fees.claimFee / feeDenominator);
        amount = claimAmount - claimFees;
    }

    return (amount, claimFees);
}





/// @dev Function to add a buyback address.
/// @param _beneficiary The address to be set as the buyback address.
function addbuyBackOrReclaimAddress(address _beneficiary, uint8 index ) external onlyProjectOwner {
    if (_beneficiary == address(0)) {
        revert ZeroAddressNotAllowed();
    }
    if(index == 0) {
       buyBackAddress = _beneficiary;
    } else if(index == 1) {
        reClaimAddress = _beneficiary;
    }
    emit BuyBackOrReclaimAddress(_beneficiary);
}


/// @dev Function for buyback of tokens.
function buyBackAndReclaim() external  nonReentrant {
    require(allocationHash != 0x0000000000000000000000000000000000000000000000000000000000000000, "First set allocation hash");
      if (buyBackAddress != msg.sender && reClaimAddress != msg.sender) {
        revert UnauthorizedAccess();
    }
    if (block.timestamp < project.endDate) {
        revert PublicSaleNotEnded();
    }
    uint256 remainingToken = afterSaleEndTokenLeft();
    uint256 purchaseUsdtAmount = calculateUsdtPerToken(remainingToken);
    if (buyBackAddress == msg.sender) {
        IERC20Upgradeable(project.usdt).safeTransferFrom(msg.sender, address(this), purchaseUsdtAmount);
        emit tokensBuyBackandReclaim(project.usdt ,msg.sender, purchaseUsdtAmount);
        IERC20Upgradeable(project.token).safeTransfer(msg.sender, remainingToken);
        emit tokensBuyBackandReclaim(project.token ,msg.sender, remainingToken);
    } else {
        IERC20Upgradeable(project.token).safeTransfer(msg.sender, remainingToken);
        emit tokensBuyBackandReclaim(project.token ,msg.sender, remainingToken);
    }
    tokenRemainingLiquidity -= remainingToken;
}

/**
 * @dev View function to calculate the amount of tokens that can be obtained for a given USDT amount.
 * @param _usdtAmount The amount of USDT for which to calculate the equivalent token amount.
 * @return The amount of tokens.
 */

   function calculateTokenAmountPerUsdt(uint256 _usdtAmount) public view returns (uint256) {
        if (project.tokenPriceInWei == 0) {
        revert EquivalentUsdtCalculationFailed();
    }
    uint8 tokenDecimals = IERC20Upgradeable(project.token).decimals();
    uint8 usdtDecimals = IERC20Upgradeable(project.usdt).decimals();
        uint256 usdtInWei = _usdtAmount * 10**(18 - usdtDecimals); // USDT to Wei
        uint256 tokens = (usdtInWei * 10**tokenDecimals) / project.tokenPriceInWei;
        return tokens;

}


/**
 * @dev View function to calculate the equivalent amount of USDT for a given token amount.
 * @param _tokenAmount The amount of tokens for which to calculate the equivalent USDT amount.
 * @return The equivalent amount of USDT.
 */

function calculateUsdtPerToken(uint256 _tokenAmount) public view returns (uint256) {
    if (project.tokenPriceInWei == 0) {
        revert EquivalentUsdtCalculationFailed();
    }
uint8 tokenDecimals = IERC20Upgradeable(project.token).decimals();
uint8 usdtDecimals = IERC20Upgradeable(project.usdt).decimals();
uint256 tokenAmountInWei = _tokenAmount * project.tokenPriceInWei;
uint256 usdtAmount = tokenAmountInWei / 10**(18  + tokenDecimals - usdtDecimals);
return usdtAmount;
}



    /**
     * @dev Allows the contract owner to emergency withdraw ERC20 tokens from the contract.
     * Only the contract owner can call this function.
     * @param _tokenAddress The address of the ERC20 token to withdraw.
     */
     function emergencyWithdrawErc20(address _tokenAddress) external onlyProjectOwner{
    require(allocationHash != 0x0000000000000000000000000000000000000000000000000000000000000000, "First set allocation hash");
      if (_tokenAddress == address(0) || _tokenAddress == project.usdt) {
        revert InvalidTokenAddress();
    }
        IERC20Upgradeable token = IERC20Upgradeable(_tokenAddress);
        if (_tokenAddress == project.token) {
            require(block.timestamp >= project.endDate, "Public sale not ended");
            uint256 availableBalance = afterSaleEndTokenLeft();
            require(availableBalance > 0, "Amount is greater than 0");
            token.safeTransfer(msg.sender, availableBalance);
             emit WithdrawToken(msg.sender, _tokenAddress, availableBalance);
        } else {
            uint256 availableBalance = token.balanceOf(address(this));
            token.safeTransfer(msg.sender, availableBalance);
             emit WithdrawToken(msg.sender, _tokenAddress, availableBalance);
        }
    }
   
}

/// @title launchpad Factory Contract
/// @author CBA
/// @notice You can use this contract for create Public Sale , whitelisthash 
contract RampStarterFactory is Initializable,OwnableUpgradeable,UUPSUpgradeable {

 
/// Hash for whiteListed addresses.
bytes32 public whitelistHash;

 /// Counter for the number of public sales conducted
 uint256 public publicSaleIndex;  
    /// Mapping of admin addresses to their authorization status
    mapping(address => bool) public adminList;
    /// Mapping of sale index to corresponding contract addresses
    mapping( uint256  => address) public saleIndexMap;
    /// Modifier to restrict access to only the contract owner or authorized admins
    modifier onlyAdmin() {
        if(owner() != msg.sender && !adminList[msg.sender]){
            revert NotAnAdmin();
        }
        _;
    }
  /// Custom error messages
  /// Sender is not an admin
 error NotAnAdmin();
/// Start date cannot be after end date
error StartDateAfterEndDate();
/// End date cannot be after TGE date
error EndDateAfterTGEDate();
/// TGE date is not within the allowed range after the end date
error TgeDateNotComesBtwRange();


/// Event emitted when the admin status is changed.
event AdminStatusChanged(
    address indexed owner,
    address indexed admin,
    bool status
);
/// Event emitted when a new whitelist hash is added
event WhitelistHashAdded(bytes32 hash);

/// Event emitted when a public sale is created, emitting all relevant parameters.
event PublicSaleCreated(
    address indexed token,
    address indexed usdt,
    uint256 tokenPriceInWei,
    uint256 startDate,
    uint256 endDate,
    uint256 cliffing,
    uint256 vestingInterval,
    uint256 vestingPercentage,
    uint256 tgeDate,
    uint256 tgePercentage,
    address owner
);

    /// Event emitted when a new public sale address is set.
     event NewpublicsaleAddress(address publicsaleAddress);

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }


     /// @dev Initializes the Factory Contract 
        function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }



    /// @dev Function to create a new public sale
    function createpublicsale(
        address _token,
        address _usdt,
        uint256 _tokenPriceInWei,
        uint256 _startDate,
        uint256 _endDate,
        uint256 _cliffing,
        uint256 _vestingInterval,
        uint256 _vestingPercentage,
        uint256 _tgeDate,
        uint256 _tgePercentage
    ) external onlyAdmin returns (address) {
    require(_token != address(0), "Token address cannot be zero");
    require(_usdt != address(0), "USDT address cannot be zero");
    require(_tokenPriceInWei > 0, "Token price must be greater than 0");
    require(_startDate > block.timestamp , "start time is always greater than current time ");
        if (_startDate >= _endDate) revert StartDateAfterEndDate();
        if (_endDate > _tgeDate) revert EndDateAfterTGEDate();
        require(_tgePercentage + _vestingPercentage <= 100000, "TGE and vesting percentages cannot exceed 100");
        if (!(_endDate <= _tgeDate && _tgeDate <= _endDate + _cliffing)) {
        revert TgeDateNotComesBtwRange();
        }

        address newpublicsaleAddress;
        projectsale newpublicsale = new projectsale(
            _token,
            _usdt,
            _tokenPriceInWei,
            _startDate,
            _endDate,
            _cliffing,
            _vestingInterval,
            _vestingPercentage,
            _tgeDate,
            _tgePercentage,
            msg.sender,
            address(this)
        );
        newpublicsaleAddress = address(newpublicsale);
        saleIndexMap[publicSaleIndex] = newpublicsaleAddress;
        publicSaleIndex++;
        emit PublicSaleCreated(_token,_usdt,_tokenPriceInWei,_startDate,_endDate,_cliffing,_vestingInterval,_vestingPercentage,_tgeDate,_tgePercentage ,msg.sender);
        emit NewpublicsaleAddress(newpublicsaleAddress);
        return newpublicsaleAddress;
    }

/// @dev Calculates the total amount of USDT raised across all projects.
/// @return The total amount of USDT deposit.
/// @return The total amount of USDT raised.
/// @return The total amount of USDT withdraw.
function totalUsdtAllProjects() public view returns( uint256 ,uint256,uint256){
  uint256 totalUsdtDeposit = 0;
  uint256 totalUsdtRaised = 0 ;
  uint256 totalWithdrawal = 0 ;
    for (uint256 i = 0 ; i < publicSaleIndex; i++) {
          projectsale project = projectsale(saleIndexMap[i]);
          totalUsdtDeposit += project.totalUsdtDeposited();
          totalUsdtRaised += project.totalUsdtRaised();
          totalWithdrawal +=  project.totalUsdtWithdrawn();
    }
    return (totalUsdtDeposit ,totalUsdtRaised,totalWithdrawal);
}

/// @dev Calculates the total amount of USDT current raised across all projects.
/// @return The total amount of USDT current raised.
function totalCurrentUsdtAllProjects() public view returns( uint256){
  uint256 totalCurrentRaised = 0;
    for (uint256 i = 0 ; i < publicSaleIndex; i++) {
          projectsale project = projectsale(saleIndexMap[i]);
          totalCurrentRaised += project.viewTotalRaisedUsdt();

    }
    return (totalCurrentRaised);
}




/// @dev Adds or removes an address from the admin list.
/// Only the contract owner can call this function.
/// @param _addr The address to be added or removed from the admin list.
/// @param _flag Boolean flag indicating whether to add or remove the address.
function addNRemoveAdmin(address[] memory _addr, bool _flag)
    public
    onlyOwner
{
    for (uint256 i = 0; i < _addr.length; i++) {
        adminList[_addr[i]] = _flag;
        emit AdminStatusChanged(msg.sender, _addr[i], _flag);
    }
}

   /// @dev Adds a new whitelist hash.
    /// Only the contract admins can call this function.
    /// @param _hash The hash to be added to the whitelist.
   function addwhitelistHash(bytes32 _hash ) external onlyAdmin {
        whitelistHash = _hash;
        emit WhitelistHashAdded(_hash);
    }

/// @dev Verifies the validity of a whitelist hash.
/// @param proof The proof elements.
/// @param user The user hash.
/// @return Whether the hash is valid.

    function verifyWhiteListHash( bytes32[] calldata proof,
        address user
    ) public view returns (bool ) {
        bytes32 leaf = keccak256(abi.encodePacked(user));
     return (MerkleProof.verify(proof, whitelistHash, leaf));

    }


/// @dev Retrieves details of a token.
/// @param _tokenAddress The address of the token contract.
/// @return _name The name of the token.
/// @return _symbol The symbol of the token.
/// @return _decimals The number of decimals used in the token.
function tokenDetails(address _tokenAddress)
    public
    view
    returns (
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    )
{
    IERC20Upgradeable token = IERC20Upgradeable(_tokenAddress);
    _name = token.name();
    _symbol = token.symbol();
    _decimals = token.decimals();
    return (_name, _symbol, _decimals);
}

/// @dev Allows the contract owner to authorize an upgrade to a new implementation.
/// @param newImplementation The address of the new implementation contract.
function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

}
